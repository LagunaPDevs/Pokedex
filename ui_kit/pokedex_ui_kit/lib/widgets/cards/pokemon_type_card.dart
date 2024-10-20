import 'package:flutter/material.dart';

// package imports
import 'package:pokedex_ui_kit/theme/color_constants.dart';
import 'package:pokedex_ui_kit/theme/pokemon_type_color_map.dart';
import 'package:pokedex_ui_kit/utils/app_fonts.dart';
import 'package:pokedex_ui_kit/utils/string_extensions.dart';

class PokemonTypeCard extends StatelessWidget {
  final String? type;

  const PokemonTypeCard({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: pokemonTypeColorMap[type] ?? PokedexThemeColor.darkGreyColor),
      child: Text(type?.capitalize() ?? "",
          style: PokedexFontStyle(context).subtitle1.copyWith(
                color: PokedexThemeColor.whiteColor,
              )),
    );
  }
}
