import 'package:flutter/material.dart';

// external libraries
import 'package:flutter_svg/flutter_svg.dart';

// package imports
import 'package:pokedex_ui_kit/model/pokemon.dart';
import 'package:pokedex_ui_kit/theme/color_constants.dart';
import 'package:pokedex_ui_kit/theme/pokemon_type_color_map.dart';
import 'package:pokedex_ui_kit/widgets/image/cached_image.dart';

// assets
import 'package:pokedex_ui_kit/constants/assets_constants.dart';

class PokemonDetailCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonDetailCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration:
          BoxDecoration(color: pokemonTypeColorMap[pokemon.types.first]),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
              top: 8,
              right: 8,
              child: SvgPicture.asset(AssetsConstants.pokeball)),
          Container(
            height: 50,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                color: PokedexThemeColor.whiteColor),
          ),
          CachedImage(
              image: pokemon.image,
              buildBody: (context, image) => Container(
                    constraints:
                        const BoxConstraints(maxWidth: 200, maxHeight: 200),
                    decoration:
                        BoxDecoration(image: DecorationImage(image: image)),
                  )),
        ],
      ),
    );
  }
}
