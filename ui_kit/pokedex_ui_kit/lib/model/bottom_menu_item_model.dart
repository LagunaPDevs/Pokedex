import 'package:flutter/material.dart';

enum BottomMenuItemMode { transparent, defaultMode, darkMode }

class BottomMenuItemModel {
  final Widget page;
  final String selectedSVG;
  final String unselectedSVG;
  final BottomMenuItemMode customBottomMenuMode;

  BottomMenuItemModel({
    required this.page,
    required this.selectedSVG,
    required this.unselectedSVG,
    this.customBottomMenuMode = BottomMenuItemMode.defaultMode,
  });
}
