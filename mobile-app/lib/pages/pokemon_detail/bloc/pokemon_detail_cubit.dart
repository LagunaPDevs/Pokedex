import 'package:flutter/material.dart';

// external libraries
import 'package:flutter_bloc/flutter_bloc.dart';
// project imports
import 'package:pokedex/core/services/pokeapi_services.dart';
// ui_kit
import 'package:pokedex_ui_kit/model/pokemon.dart';

part 'pokemon_detail_state.dart';

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  PokemonDetailCubit() : super(PokemonDetailState.initial());

  Future<void> init(BuildContext context, {required int pokemonId}) async {
    final response = await PokeApiServices.getPokemon(pokemonId);
    emit(state.copyWith(isLoading: false, pokemon: response));
  }
}
