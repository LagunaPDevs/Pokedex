import 'package:flutter/material.dart';

// external libraries
import 'package:flutter_svg/flutter_svg.dart';

// package imports
import 'package:pokedex_ui_kit/constants/svg_icons_constants.dart';
import 'package:pokedex_ui_kit/theme/color_constants.dart';
import 'package:pokedex_ui_kit/utils/app_fonts.dart';
import 'package:pokedex_ui_kit/utils/string_extensions.dart';

class PokemonListAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final String title;
  final String actionSvgPath;
  final Function() hideFunction;
  final bool isExpanded;
  final Widget child;

  const PokemonListAppBar({
    super.key,
    required this.child,
    required this.isExpanded,
    required this.actionSvgPath,
    required this.backgroundColor,
    required this.hideFunction,
    required this.title,
  });

  @override
  State<PokemonListAppBar> createState() => _PokemonListAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(isExpanded ? 120 : 80);
}

class _PokemonListAppBarState extends State<PokemonListAppBar> {
  bool hideChild = true;
  double bottomHeight = 50;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: widget.backgroundColor,
      leadingWidth: 48,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: SvgPicture.asset(
          PokedexIcons.pokeball,
          colorFilter: const ColorFilter.mode(
              PokedexThemeColor.whiteColor, BlendMode.srcIn),
        ),
      ),
      title: Text(widget.title.capitalize(),
          style: PokedexFontStyle(context)
              .headline
              .copyWith(color: PokedexThemeColor.whiteColor)),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: InkWell(
            onTap: () {
              setState(() {
                widget.hideFunction();
                hideChild = widget.isExpanded;
              });
            },
            child: AnimatedContainer(
              width: 32,
              height: 32,
              duration: const Duration(milliseconds: 300),
              child: SvgPicture.asset(
                hideChild ? widget.actionSvgPath : PokedexIcons.close,
                colorFilter: const ColorFilter.mode(
                    PokedexThemeColor.whiteColor, BlendMode.srcIn),
              ),
            ),
          ),
        )
      ],
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Column(
            children: [
              AnimatedContainer(
                transformAlignment: AlignmentDirectional.topCenter,
                curve: Curves.ease,
                margin: const EdgeInsets.all(8),
                height: hideChild ? 0 : 50,
                duration: const Duration(milliseconds: 500),
                child: widget.child,
              ),
              Container(
                height: 8,
                decoration: const BoxDecoration(
                    color: PokedexThemeColor.whiteColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
              ),
            ],
          )),
    );
  }
}
