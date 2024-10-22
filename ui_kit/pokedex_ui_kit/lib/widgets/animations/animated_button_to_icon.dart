import 'package:flutter/material.dart';
import 'package:pokedex_ui_kit/theme/color_constants.dart';
import 'package:pokedex_ui_kit/utils/app_fonts.dart';

class AnimatedButtonToIcon extends StatefulWidget {
  final bool reset;
  final String title;
  final Function() onTap;
  final bool isCaptured;
  final Widget transitionWidget;

  const AnimatedButtonToIcon(
      {super.key,
      required this.reset,
      required this.title,
      required this.onTap,
      required this.isCaptured,
      required this.transitionWidget});

  @override
  State<AnimatedButtonToIcon> createState() => _AnimatedButtonToIconState();
}

class _AnimatedButtonToIconState extends State<AnimatedButtonToIcon> {
  bool animate = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: _onButtonClick(),
        child: AnimatedContainer(
            duration: const Duration(microseconds: 200),
            curve: Curves.linear,
            constraints: BoxConstraints(maxWidth: _buttonWidth()),
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: _buttonColor(),
                borderRadius: BorderRadius.circular(50),
                border: _borderColor()),
            child: _child()));
  }

  Color _buttonColor() {
    if (widget.isCaptured) return PokedexThemeColor.whiteColor;
    if (animate) return Colors.transparent;
    return PokedexThemeColor.electricBlue;
  }

  BoxBorder? _borderColor() {
    if (animate) return null;
    if (widget.isCaptured) {
      return Border.all(color: PokedexThemeColor.electricBlue);
    }
    return null;
  }

  double _buttonWidth() {
    if (animate) return 100;
    return MediaQuery.of(context).size.width * 0.8;
  }

  Widget _child() {
    if (animate) return widget.transitionWidget;
    return Text(widget.title,
        style: PokedexFontStyle(context).subtitle1.copyWith(
            color: widget.isCaptured
                ? PokedexThemeColor.electricBlue
                : PokedexThemeColor.whiteColor));
  }

  Function()? _onButtonClick() {
    return () {
      if (!animate) {
        widget.onTap();
        setState(() => animate = !animate);
        if (widget.reset) {
          Future.delayed(const Duration(milliseconds: 2000),
              () => setState(() => animate = !animate));
        }
      }
    };
  }
}
