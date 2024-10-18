import 'package:flutter/material.dart';
import 'package:pokedex/core/helpers/base_page.dart';
import 'package:pokedex/pages/pokemon_region/bloc/pokemon_region_cubit.dart';

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
            child: state.isLoading
                ? CircularProgressIndicator()
                : GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 220,
                            mainAxisSpacing: 12),
                    itemCount: state.pokemonList.length,
                    itemBuilder: (context, index) => Container(
                        child: Column(children: [
                      Text("#${state.pokemonList[index].id}"),
                      Text(state.pokemonList[index].name)
                    ])),
                  )));
  }
}
