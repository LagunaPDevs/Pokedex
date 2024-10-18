import 'package:flutter/material.dart';
import 'package:pokedex/core/helpers/base_page.dart';
import 'package:pokedex/pages/pokemon_region/bloc/pokemon_region_cubit.dart';
import 'package:pokedex_ui_kit/widgets/cards/pokemon_grid_card.dart';

class PokemonRegion extends BasePage<PokemonRegionState, PokemonRegionCubit> {
  final String regionName;
  const PokemonRegion({super.key, required this.regionName});
  @override
  PokemonRegionCubit createBloc(BuildContext context) =>
      PokemonRegionCubit()..init(context, regionName: regionName);

  @override
  Widget buildPage(
      BuildContext context, PokemonRegionState state, PokemonRegionCubit bloc) {
    return Scaffold(
        body: Center(
            child: GridView.builder(
      shrinkWrap: true,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: state.pokemonList.length,
      itemBuilder: (context, index) => PokemonGridCard(
        pokemon: state.pokemonList[index],
        onTap: (id) => bloc.onClick(context, id: id),
      ),
    )));
  }
}
