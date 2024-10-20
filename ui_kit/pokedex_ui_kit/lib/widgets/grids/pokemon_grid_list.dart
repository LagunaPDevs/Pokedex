import 'package:flutter/material.dart';

// package imports
import 'package:pokedex_ui_kit/model/pokemon.dart';
import 'package:pokedex_ui_kit/widgets/cards/empty_results_card.dart';
import 'package:pokedex_ui_kit/widgets/cards/pokemon_grid_card.dart';
import 'package:pokedex_ui_kit/widgets/loading/pikachu_running_loader.dart';

class PokemonGridList extends StatelessWidget {
  final bool isLoading;
  final List<Pokemon> pokemonList;
  final Function(int) onPokemonClick;

  const PokemonGridList(
      {super.key,
      required this.isLoading,
      required this.pokemonList,
      required this.onPokemonClick});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: isLoading
            ? const PikachuRunningLoader()
            : pokemonList.isEmpty
                ? const EmptyResultsCard(message: "No results found")
                : GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemCount: pokemonList.length,
                    itemBuilder: (context, index) => PokemonGridCard(
                      pokemon: pokemonList[index],
                      onTap: (id) => onPokemonClick(id),
                    ),
                  ));
  }
}
