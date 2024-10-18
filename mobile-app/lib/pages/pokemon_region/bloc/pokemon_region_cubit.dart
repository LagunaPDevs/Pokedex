import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// project imports
import 'package:pokedex/core/services/pokeapi_services.dart';

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
}
