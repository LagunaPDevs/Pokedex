import 'package:flutter/material.dart';

// external libraries
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// project imports
import 'package:pokedex_ui_kit/model/pokemon.dart';
import 'package:pokedex/core/models/storaged_captured_pokemon.dart';
import 'package:pokedex/core/services/storage_services.dart';
import 'package:pokedex/routes/route_page_manager.dart';

// ui_kit
import 'package:pokedex_ui_kit/theme/color_constants.dart';
import 'package:pokedex_ui_kit/theme/pokemon_type_color_map.dart';

part 'captured_pokemons_state.dart';

class CapturedPokemonsCubit extends Cubit<CapturedPokemonsState> {
  CapturedPokemonsCubit() : super(CapturedPokemonsState.initial());

  Future<void> init(BuildContext context) async {
    // We get storaged pokemons from storage and set appbar color with the
    // result
    await getCapturedPokemonsFromStorage();
    await setAppBarColor();
  }

  // Get captured list from storage and set page vars
  Future<void> getCapturedPokemonsFromStorage() async {
    StoragedCapturedPokemons capturedPokemons =
        await StorageServices.getCapturedPokemonsList(state.storage);
    capturedPokemons.capturedPokemons.sort((a, b) => a.id.compareTo(b.id));
    emit(state.copyWith(
        isLoading: false,
        initialCapturedList: capturedPokemons.capturedPokemons,
        capturedList: capturedPokemons.capturedPokemons));
    getPokemonsTypes();
  }

  // On pokemon card click
  // We need to handle comming back from detailed page as user might has
  // release or catched pokemon
  onClick(BuildContext context, {required int id}) async {
    RoutePageManager.of(context)
        .openPokemonDetail(id: id, handleGoBack: () => backFromDetailedPage());
  }

  // Handle comming back from pokemon detailed page
  // We check again storage as there might be some changes on captured pokemons
  // list
  backFromDetailedPage() async {
    emit(state.copyWith(
        isLoading: true, selectedFilter: CapturedPokemonsFilterBy.byId));
    await getCapturedPokemonsFromStorage();
    await setAppBarColor();
  }

  // On change radio button group value
  onFilterChange(CapturedPokemonsFilterBy? value) {
    emit(state.copyWith(selectedFilter: value));
    switch (value) {
      case CapturedPokemonsFilterBy.byId:
        orderListById();
        break;
      case CapturedPokemonsFilterBy.byName:
        orderListByName();
        break;
      case CapturedPokemonsFilterBy.byType:
        orderListByType();
        break;
      default:
        orderListById();
    }
  }

  /// Set the title of each [RadioListTile] element
  filterStringValue(CapturedPokemonsFilterBy value) {
    switch (value) {
      case CapturedPokemonsFilterBy.byId:
        return "ID";
      case CapturedPokemonsFilterBy.byName:
        return "Name";
      case CapturedPokemonsFilterBy.byType:
        return "Type";
      default:
        return "ID";
    }
  }

  // Sort the list by pokemon ID
  orderListById() {
    emit(state.copyWith(capturedList: state.initialCapturedList));
    state.capturedList.sort((a, b) => a.id.compareTo(b.id));
    emit(state.copyWith(capturedList: state.capturedList));
  }

  // Sort the list by pokemon name
  orderListByName() {
    emit(state.copyWith(capturedList: state.initialCapturedList));
    state.capturedList.sort((a, b) => a.name.compareTo(b.name));
    emit(state.copyWith(capturedList: state.capturedList));
  }

  // Sort the list by main pokemon type
  orderListByType() {
    emit(state.copyWith(capturedList: state.initialCapturedList));
    state.capturedList.sort((a, b) => a.types.first.compareTo(b.types.first));
    emit(state.copyWith(capturedList: state.capturedList));
  }

  // Open or close filter bar in the AppBar
  onExpandableClick() =>
      emit(state.copyWith(expandedAppbar: !state.expandedAppbar));

  // Change appbar color based on the most captured type of pokemon
  setAppBarColor() async {
    final pokemonType =
        await StorageServices.getMostRepeatedTypeInStorage(state.storage);
    emit(state.copyWith(
        appbarColor: pokemonTypeColorMap[pokemonType], isLoading: false));
  }

  // Get all the types of the pokemons from the pokemons list
  getPokemonsTypes() {
    List<String> typesList = [];
    for (var pokemon in state.capturedList) {
      for (var type in pokemon.types) {
        if (!typesList.contains(type)) {
          typesList.add(type);
        }
      }
    }
    emit(state.copyWith(pokemonTypes: typesList));
  }

  // Filter by a pokemon's type
  onTypeClick(String value) {
    emit(state.copyWith(capturedList: state.initialCapturedList));
    List<Pokemon> pokemonsByType = [];
    for (var pokemon in state.capturedList) {
      for (var type in pokemon.types) {
        if (value == type) {
          pokemonsByType.add(pokemon);
        }
      }
    }
    emit(state.copyWith(capturedList: pokemonsByType));
  }
}
