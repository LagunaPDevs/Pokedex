import 'package:flutter/material.dart';

class PokedexFontStyle {
  final BuildContext context;

  PokedexFontStyle(this.context);

  static const _baseBoldTextStyle = TextStyle(fontWeight: FontWeight.w900);
  static const _baseRegularTextStyle = TextStyle(fontWeight: FontWeight.w400);

  TextStyle get headline {
    return _baseBoldTextStyle.copyWith(fontSize: 32);
  }

  TextStyle get subtitle1 {
    return _baseBoldTextStyle.copyWith(fontSize: 16);
  }

  TextStyle get subtitle2 {
    return _baseBoldTextStyle.copyWith(fontSize: 14);
  }

  TextStyle get subtitle3 {
    return _baseBoldTextStyle.copyWith(fontSize: 10);
  }

  TextStyle get caption {
    return _baseRegularTextStyle.copyWith(fontSize: 12);
  }

  TextStyle get body1 {
    return _baseRegularTextStyle.copyWith(fontSize: 16);
  }

  TextStyle get body2 {
    return _baseRegularTextStyle.copyWith(fontSize: 12);
  }

  TextStyle get body3 {
    return _baseRegularTextStyle.copyWith(fontSize: 10);
  }
}
