import 'package:flutter/material.dart';
import 'package:pokedex/pages/captured_pokemons/bloc/captured_pokemons_cubit.dart';
import 'package:pokedex_ui_kit/widgets/cards/pokemon_type_card.dart';

class TypeFilterSelector extends StatelessWidget {
  final CapturedPokemonsCubit bloc;
  final CapturedPokemonsState state;

  const TypeFilterSelector(
      {super.key, required this.bloc, required this.state});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxHeight = constraints.maxHeight;
      return AnimatedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        constraints: BoxConstraints(maxHeight: maxHeight),
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
        child: Visibility(
          visible: state.selectedFilter == CapturedPokemonsFilterBy.byType,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
                state.pokemonTypes.length,
                (index) => InkWell(
                    onTap: () => bloc.onTypeClick(state.pokemonTypes[index]),
                    child: PokemonTypeCard(type: state.pokemonTypes[index]))),
          ),
        ),
      );
    });
  }
}
