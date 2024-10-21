import 'package:flutter/material.dart';

// package imports
import 'package:pokedex_ui_kit/theme/color_constants.dart';

ThemeData defaultTheme = ThemeData(
    fontFamily: "Poppins",
    primaryColor: PokedexThemeColor.whiteColor,
    unselectedWidgetColor: PokedexThemeColor.lightGreyColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: PokedexThemeColor.electricBlue,
      foregroundColor: PokedexThemeColor.whiteColor,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: const StadiumBorder(),
    )));
