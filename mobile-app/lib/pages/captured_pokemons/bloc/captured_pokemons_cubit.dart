import 'package:flutter/material.dart';
// external libraries
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// project imports
import 'package:pokedex_ui_kit/model/pokemon.dart';
import 'package:pokedex/core/models/storaged_captured_pokemon.dart';
import 'package:pokedex/core/services/storage_services.dart';
import 'package:pokedex/routes/route_page_manager.dart';

part 'captured_pokemons_state.dart';

class CapturedPokemonsCubit extends Cubit<CapturedPokemonsState> {
  CapturedPokemonsCubit() : super(CapturedPokemonsState.initial());

  Future<void> init(BuildContext context) async {
    await getCapturedPokemonsFromStorage();
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
    state.capturedList.sort((a, b) => a.id.compareTo(b.id));
    emit(state.copyWith(capturedList: state.capturedList));
  }

  // Sort the list by pokemon name
  orderListByName() {
    state.capturedList.sort((a, b) => a.name.compareTo(b.name));
    emit(state.copyWith(capturedList: state.capturedList));
  }

  // Sort the list by main pokemon type
  orderListByType() {
    state.capturedList.sort((a, b) => a.types.first.compareTo(b.types.first));
    emit(state.copyWith(capturedList: state.capturedList));
  }

  // Open or close search bar in the AppBar
  onExpandableClick() =>
      emit(state.copyWith(expandedAppbar: !state.expandedAppbar));
}
