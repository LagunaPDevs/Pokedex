import 'package:flutter/material.dart';

// external libraries
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pokedex/core/models/storaged_captured_pokemon.dart';

// project imports
import 'package:pokedex/core/services/pokeapi_services.dart';
import 'package:pokedex/core/constants/storage_constants.dart';
import 'package:pokedex/core/services/storage_services.dart';

// ui_kit
import 'package:pokedex_ui_kit/model/pokemon.dart';

part 'pokemon_detail_state.dart';

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  PokemonDetailCubit() : super(PokemonDetailState.initial());

  Future<void> init(BuildContext context, {required int pokemonId}) async {
    final response = await PokeApiServices.getPokemon(pokemonId);

    // Search in captured pokemons list if the current pokemon has been captured
    StoragedCapturedPokemons capturedPokemons =
        await StorageServices.getCapturedPokemonsList(state.storage);
    Pokemon captured = capturedPokemons.capturedPokemons.firstWhere(
      (captured) => captured.id == pokemonId,
      orElse: () => Pokemon.fromNoData(),
    );
    emit(state.copyWith(
        isLoading: false, pokemon: response, isCaptured: captured.id != 0));
  }

  // If current pokemon wasn't captured, we add to captured_pokemons object in
  // our device storage
  // If so, we remove from captured_pokemons object in our device storage

  onButtonClick() async {
    emit(state.copyWith(isCaptured: !state.isCaptured));
    StoragedCapturedPokemons capturedPokemons =
        await StorageServices.getCapturedPokemonsList(state.storage);
    if (state.isCaptured) {
      capturedPokemons.capturedPokemons.add(state.pokemon!);
    } else {
      capturedPokemons.capturedPokemons
          .removeWhere((captured) => captured.id == state.pokemon?.id);
    }
    state.storage.write(
        key: StorageConstants.capturedPokemons,
        value: capturedPokemons
            .storagedCapturedPokemonsToEncode(capturedPokemons));
  }
}
