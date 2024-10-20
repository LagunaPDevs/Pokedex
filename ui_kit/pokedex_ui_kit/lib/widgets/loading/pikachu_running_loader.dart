import 'package:flutter/widgets.dart';

// external libraries
import 'package:lottie/lottie.dart';
import 'package:pokedex_ui_kit/constants/assets_constants.dart';

class PikachuRunningLoader extends StatelessWidget {
  const PikachuRunningLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Lottie.asset(AssetsConstants.pikachuRunning));
  }
}
