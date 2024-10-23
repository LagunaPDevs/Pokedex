import 'package:flutter/material.dart';

// external libraries
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// project imports
import 'package:pokedex/core/services/pokeapi_services.dart';
import 'package:pokedex/core/services/storage_services.dart';
import 'package:pokedex/routes/route_page_manager.dart';
import 'package:pokedex/core/providers/auth_provider.dart';

// ui_kit
import 'package:pokedex_ui_kit/model/pokemon.dart';
import 'package:pokedex_ui_kit/theme/color_constants.dart';
import 'package:pokedex_ui_kit/theme/pokemon_type_color_map.dart';

part 'pokemon_region_state.dart';

class PokemonRegionCubit extends Cubit<PokemonRegionState> {
  PokemonRegionCubit() : super(PokemonRegionState.initial());

  Future<void> init(BuildContext context, {required String regionName}) async {
    final pokemonList =
        await PokeApiServices.getPokemonList(regionName: regionName);
    // As we are going to enable search, we save the result of the query in
    //"initialList" var so we don't need to request it again
    emit(state.copyWith(initialList: pokemonList, pokemonList: pokemonList));
    // Set appbar color based in most captured pokemon type
    await setAppBarColor();
    // After that we can hide the splash screen
    if (context.mounted) context.read<AuthProvider>().loadingFinished = true;
  }

  // On Pokemon click opens Pokemon Detailed page
  onClick(BuildContext context, {required int id}) async =>
      RoutePageManager.of(context).openPokemonDetail(
          id: id, handleGoBack: () async => await backFromDetailedPage());

  // Comming back from Pokemon Detailed page we check storaged captured pokemons
  // and update appbar color with the result
  backFromDetailedPage() async {
    emit(state.copyWith(isLoading: true));
    await setAppBarColor();
  }

  // On search event
  onSearch(String value) {
    emit(state.copyWith(isLoading: true));
    if (value.isEmpty) {
      emit(state.copyWith(pokemonList: state.initialList));
    } else {
      List<Pokemon> resultList = state.initialList
          .where((pokemon) =>
              pokemon.name.toLowerCase().startsWith(value.toLowerCase()) ||
              pokemon.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      emit(state.copyWith(pokemonList: resultList));
    }
    emit(state.copyWith(isLoading: false));
  }

  // Open or close search bar in the AppBar
  onExpandableClick() =>
      emit(state.copyWith(expandedAppbar: !state.expandedAppbar));

  // Change appbar color based on the most captured type of pokemon
  setAppBarColor() async {
    // important to first get the updated list of captured pokemons
    await StorageServices.getCapturedPokemonsList(state.storage);
    final pokemonType =
        await StorageServices.getMostRepeatedTypeInStorage(state.storage);
    emit(state.copyWith(
        appbarColor: pokemonTypeColorMap[pokemonType], isLoading: false));
  }
}
