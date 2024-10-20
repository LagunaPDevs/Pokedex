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
    emit(state.copyWith(isLoading: true));
    await getCapturedPokemonsFromStorage();
  }
}
