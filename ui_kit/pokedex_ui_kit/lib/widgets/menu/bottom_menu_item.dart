import 'package:flutter/material.dart';

// external libraries
import 'package:flutter_svg/flutter_svg.dart';

class BottomMenuItem extends StatelessWidget {
  final Function() onTap;
  final bool selected;
  final String selectedSvgPath;
  final String unselectedSvgPath;

  const BottomMenuItem(
      {super.key,
      required this.onTap,
      required this.selected,
      required this.selectedSvgPath,
      required this.unselectedSvgPath});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onTap,
        icon: Opacity(
            opacity: selected ? 1 : 0.25,
            child: SizedBox(
              width: 32,
              height: 32,
              child: SvgPicture.asset(
                selected ? selectedSvgPath : unselectedSvgPath,
              ),
            )));
  }
}
