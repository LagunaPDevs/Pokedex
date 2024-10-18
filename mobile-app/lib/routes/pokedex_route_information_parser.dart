import 'package:flutter/material.dart';

// project imports
import 'package:pokedex/routes/pages_routes.dart';
import 'package:pokedex/routes/pokedex_route_path.dart';

class PokedexRouteInformationParser
    extends RouteInformationParser<PokedexRoutePath> {
  @override
  Future<PokedexRoutePath> parseRouteInformation(
          RouteInformation routeInfo) async =>
      PokedexRoutePath.parse(routeInfo.uri.path);

  RouteInformation? restoreRouterInformation(PokedexRoutePath path) {
    if (path.isRootPage) {
      return RouteInformation(uri: Uri.parse(PagesRoutes.rootPage));
    }
    if (path.isRegionPage) {
      return RouteInformation(uri: Uri.parse(PagesRoutes.regionPage));
    }
    return null;
  }
}
