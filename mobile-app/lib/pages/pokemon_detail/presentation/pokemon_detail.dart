import 'package:flutter/material.dart';

// project imports
import 'package:pokedex/core/helpers/base_page.dart';
import 'package:pokedex/pages/pokemon_detail/bloc/pokemon_detail_cubit.dart';

// ui_kit
import 'package:pokedex_ui_kit/theme/color_constants.dart';
import 'package:pokedex_ui_kit/widgets/cards/pokemon_detail_card.dart';
import 'package:pokedex_ui_kit/widgets/app_bars/pokemon_detail_app_bar.dart';
import 'package:pokedex_ui_kit/widgets/cards/pokemon_type_card.dart';
import 'package:pokedex_ui_kit/widgets/boxes/pokemon_about_box.dart';

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
      backgroundColor: PokedexThemeColor.whiteColor,
      extendBodyBehindAppBar: true,
      appBar: PokemonDetailAppBar(
        pokemon: state.pokemon,
        onBackTap: () => Navigator.pop(context),
      ),
      body: state.pokemon != null
          ? SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PokemonDetailCard(pokemon: state.pokemon!),
                    Wrap(
                      spacing: 8,
                      children: List.generate(
                          state.pokemon?.types.length ?? 0,
                          (index) => PokemonTypeCard(
                              type: state.pokemon?.types[index])),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    PokemonAboutBox(pokemon: state.pokemon!)
                  ],
                ),
              ))
          : CircularProgressIndicator(),
    );
  }
}
