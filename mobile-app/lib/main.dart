import 'package:flutter/material.dart';

// external libraries
import 'package:provider/provider.dart';

// project imports
import 'package:pokedex/core/providers/auth_provider.dart';
import 'package:pokedex/routes/pokedex_route_information_parser.dart';
import 'package:pokedex/routes/pokedex_router_delegation.dart';

// ui_kit
import 'package:pokedex_ui_kit/theme/default_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
      builder: (context, child) => MaterialApp.router(
        title: 'pokedex',
        debugShowCheckedModeBanner: false,
        theme: defaultTheme,
        routerDelegate: PokedexRouterDelegation(),
        routeInformationParser: PokedexRouteInformationParser(),
      ),
    );
  }
}
