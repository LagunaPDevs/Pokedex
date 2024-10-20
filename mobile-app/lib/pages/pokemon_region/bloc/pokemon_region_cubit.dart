import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// project imports
import 'package:pokedex/core/services/pokeapi_services.dart';
import 'package:pokedex/routes/route_page_manager.dart';

// ui_kit
import 'package:pokedex_ui_kit/model/pokemon.dart';

part 'pokemon_region_state.dart';

class PokemonRegionCubit extends Cubit<PokemonRegionState> {
  PokemonRegionCubit() : super(PokemonRegionState.initial());

  Future<void> init(BuildContext context, {required String regionName}) async {
    final pokemonList =
        await PokeApiServices.getPokemonList(regionName: regionName);
    // As we are going to enable search in the page, we save the result of the
    // query in "initialList" var so we don't need to request it again
    emit(state.copyWith(
        isLoading: false, initialList: pokemonList, pokemonList: pokemonList));
  }

  // On Pokemon click opens Pokemon Detailed page
  onClick(BuildContext context, {required int id}) =>
      RoutePageManager.of(context).openPokemonDetail(id: id);

  // On search event
  onSearch(String value) {
    emit(state.copyWith(isLoading: true));
    if (value.isEmpty) {
      emit(state.copyWith(pokemonList: state.initialList));
    } else {
      List<Pokemon> resultList = state.pokemonList
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
}
