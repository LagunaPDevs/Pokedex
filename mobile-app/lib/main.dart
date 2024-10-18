import 'package:flutter/material.dart';
import 'package:pokedex/routes/pokedex_route_information_parser.dart';
import 'package:pokedex/routes/pokedex_router_delegation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'pokedex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Poppins"),
      routerDelegate: PokedexRouterDelegation(),
      routeInformationParser: PokedexRouteInformationParser(),
    );
  }
}
