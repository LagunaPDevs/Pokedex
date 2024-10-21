import 'package:flutter/cupertino.dart';

// package imports
import 'package:pokedex_ui_kit/constants/assets_constants.dart';
import 'package:pokedex_ui_kit/theme/color_constants.dart';

class LogoSplashScreen extends StatelessWidget {
  const LogoSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PokedexThemeColor.electricBlue,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Image.asset(AssetsConstants.pokedexLogo),
      ),
    );
  }
}
