import 'package:flutter/material.dart';

// external libraries
import 'package:provider/provider.dart';

// project imports
import 'package:pokedex/core/helpers/base_page.dart';
import 'package:pokedex/core/providers/auth_provider.dart';
import 'package:pokedex/pages/loading/bloc/loading_cubit.dart';
import 'package:pokedex/pages/root_page/presentation/root_page.dart';

// ui_kit
import 'package:pokedex_ui_kit/widgets/loading/logo_splash_screen.dart';

class LoadingPage extends BasePage<LoadingState, LoadingCubit> {
  const LoadingPage({super.key});

  @override
  LoadingCubit createBloc(BuildContext context) =>
      LoadingCubit()..init(context);
  @override
  Widget buildPage(
      BuildContext context, LoadingState state, LoadingCubit bloc) {
    return Scaffold(
        body: Consumer<AuthProvider>(
            builder: (context, value, child) =>
                Stack(alignment: AlignmentDirectional.bottomStart, children: [
                  RootPage(),
                  !value.loadingFinished
                      ? const LogoSplashScreen()
                      : const SizedBox(),
                ])));
  }
}
