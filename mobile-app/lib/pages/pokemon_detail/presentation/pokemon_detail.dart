import 'package:flutter/material.dart';
// project
import 'package:pokedex/core/helpers/base_page.dart';
import 'package:pokedex/pages/pokemon_detail/bloc/pokemon_detail_cubit.dart';

class PokemonDetail extends BasePage<PokemonDetailState, PokemonDetailCubit> {
  final int pokemonId;
  const PokemonDetail({super.key, required this.pokemonId});

  @override
  PokemonDetailCubit createBloc(BuildContext context) =>
      PokemonDetailCubit()..init(context, pokemonId: pokemonId);

  @override
  Widget buildPage(
      BuildContext context, PokemonDetailState state, PokemonDetailCubit bloc) {
    return Scaffold(
      body: Center(
        child: state.pokemon != null
            ? Text(state.pokemon!.name)
            : CircularProgressIndicator(),
      ),
    );
  }
}
