import 'package:flutter/material.dart';

// external libraries
import 'package:pokedex_ui_kit/constants/assets_constants.dart';

// package imports
import 'package:pokedex_ui_kit/utils/app_fonts.dart';

class EmptyResultsCard extends StatelessWidget {
  final String message;

  const EmptyResultsCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.6,
          maxWidth: MediaQuery.of(context).size.width * 0.8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.4,
              maxHeight: MediaQuery.of(context).size.height * 0.4,
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AssetsConstants.magikarpJump))),
          ),
          Text("Karp...Karp... Magikarp...",
              style: PokedexFontStyle(context).body1),
          Text(message, style: PokedexFontStyle(context).body1)
        ],
      ),
    );
  }
}
