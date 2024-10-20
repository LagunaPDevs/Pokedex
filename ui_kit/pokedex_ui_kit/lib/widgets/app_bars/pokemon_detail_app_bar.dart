import 'package:flutter/material.dart';

// external libraries
import 'package:flutter_svg/flutter_svg.dart';

// package imports
import 'package:pokedex_ui_kit/model/pokemon.dart';
import 'package:pokedex_ui_kit/theme/color_constants.dart';
import 'package:pokedex_ui_kit/utils/app_fonts.dart';
import 'package:pokedex_ui_kit/utils/string_extensions.dart';

// assets
import 'package:pokedex_ui_kit/constants/svg_icons_constants.dart';

class PokemonDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Pokemon? pokemon;
  final Function() onBackTap;

  const PokemonDetailAppBar(
      {super.key, required this.pokemon, required this.onBackTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leadingWidth: 48,
      forceMaterialTransparency: true,
      leading: InkWell(
        onTap: onBackTap,
        child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: SvgPicture.asset(
              PokedexIcons.arrowBack,
              colorFilter: const ColorFilter.mode(
                  PokedexThemeColor.whiteColor, BlendMode.srcIn),
            )),
      ),
      title: Text(
        pokemon?.name.capitalize() ?? '',
        style: PokedexFontStyle(context).headline.copyWith(
              color: PokedexThemeColor.whiteColor,
            ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text("#${pokemon?.id}",
              style: PokedexFontStyle(context)
                  .subtitle1
                  .copyWith(color: PokedexThemeColor.whiteColor)),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
