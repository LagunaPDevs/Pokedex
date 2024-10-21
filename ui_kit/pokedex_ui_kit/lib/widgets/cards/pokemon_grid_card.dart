import 'package:flutter/material.dart';

// package imports
import 'package:pokedex_ui_kit/model/pokemon.dart';
import 'package:pokedex_ui_kit/theme/color_constants.dart';
import 'package:pokedex_ui_kit/utils/app_fonts.dart';
import 'package:pokedex_ui_kit/utils/string_extensions.dart';
import 'package:pokedex_ui_kit/widgets/image/cached_image.dart';

class PokemonGridCard extends StatelessWidget {
  final Pokemon pokemon;
  final Function(int) onTap;
  const PokemonGridCard(
      {super.key, required this.pokemon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(pokemon.id),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: PokedexThemeColor.whiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: PokedexThemeColor.mediumGreyColor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ]),
        child: LayoutBuilder(builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final maxHeight = constraints.maxHeight;

          return Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned.fill(
                top: maxHeight * 0.5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: PokedexThemeColor.backgroundGreyColor,
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              Positioned(
                top: 20,
                child: Column(
                  children: [
                    CachedImage(
                        image: pokemon.image,
                        buildBody: (context, image) => Container(
                              constraints: BoxConstraints(
                                  maxHeight: maxHeight * 0.6,
                                  maxWidth: maxWidth * 0.6),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: image, fit: BoxFit.cover)),
                            )),
                    Text(
                      pokemon.name.capitalize(),
                      overflow: TextOverflow.ellipsis,
                      style: PokedexFontStyle(context).body1,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Positioned(
                right: 8,
                top: 4,
                child: Text(
                  "#${pokemon.id}",
                  style: PokedexFontStyle(context).body2.copyWith(
                        color: PokedexThemeColor.mediumGreyColor,
                      ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
