import 'package:flutter/material.dart';

// package imports
import 'package:pokedex_ui_kit/model/pokemon.dart';
import 'package:pokedex_ui_kit/theme/color_constants.dart';
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
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(2, 4),
              ),
            ]),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned.fill(
              top: 70,
              left: 0,
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
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: image, fit: BoxFit.cover)),
                          )),
                  Text(
                    pokemon.name.capitalize(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16),
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
                style: const TextStyle(
                    color: PokedexThemeColor.mediumGreyColor, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
