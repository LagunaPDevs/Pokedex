import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// package imports
import 'package:pokedex_ui_kit/constants/svg_icons_constants.dart';
import 'package:pokedex_ui_kit/model/pokemon.dart';
import 'package:pokedex_ui_kit/theme/color_constants.dart';
import 'package:pokedex_ui_kit/theme/pokemon_type_color_map.dart';
import 'package:pokedex_ui_kit/widgets/cards/pokemon_info_card.dart';

class PokemonAboutBox extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonAboutBox({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.8,
      ),
      child: Column(
        children: [
          Text("About",
              style: TextStyle(
                  color: pokemonTypeColorMap[pokemon.types.first],
                  fontSize: 16,
                  fontWeight: FontWeight.w900)),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PokemonInfoCard(
                    iconPath: PokedexIcons.weight,
                    value: pokemon.weight.toString(),
                    name: "Weight"),
              ),
              const SizedBox(
                height: 50,
                child: VerticalDivider(
                  width: 20,
                  thickness: 1,
                  endIndent: 0,
                  color: PokedexThemeColor.mediumGreyColor,
                ),
              ),
              Expanded(
                child: PokemonInfoCard(
                    iconPath: PokedexIcons.straighten,
                    value: pokemon.height.toString(),
                    name: "Height"),
              )
            ],
          )
        ],
      ),
    );
  }
}
