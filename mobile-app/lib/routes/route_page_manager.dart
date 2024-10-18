import 'package:flutter/material.dart';
import 'package:pokedex/routes/pages_routes.dart';
import 'package:pokedex/routes/pokedex_route_path.dart';

// external libraries
import 'package:provider/provider.dart';

// project imports
import 'package:pokedex/routes/router_page_model.dart';
import 'package:pokedex/pages/pokemon_region/presentation/pokemon_region.dart';

class RoutePageManager extends ChangeNotifier {
  static RoutePageManager of(BuildContext context) =>
      Provider.of<RoutePageManager>(context, listen: false);

  List<RouterPageModel> _routerPageModels = [];

  final List<Page> _pages = [
    MaterialPage(
        name: PagesRoutes.rootPage,
        key: UniqueKey(),
        child: const PokemonRegion(regionName: "kanto"))
  ];

  List<Page> get pages => List.unmodifiable(_pages);
  List<RouterPageModel> get routerPageModels => _routerPageModels;

  PokedexRoutePath get currentPath => PokedexRoutePath.parse(_pages.last.name!);

  // var setter
  set routerPageModels(List<RouterPageModel>? routerPageModels) =>
      _routerPageModels = routerPageModels ?? _routerPageModels;

  // remove page from the stack
  void didPop(RouteSettings page) {
    _pages.removeWhere((element) => (element.name == page.name));
    _activeEventGoBackToList(page.name!);
    notifyListeners();
  }

  // private navigation methods
  // allows me to add a new view to the navigation stack, without affecting the navigation that comes in the queue
  void _pushName({
    required String name,
    required Widget page,
    Function? handledGoBack,
  }) {
    _addEventGoBackToList(RouterPageModel(key: name, handled: handledGoBack));
    _pages.add(
      MaterialPage(
        name: name,
        child: page,
        key: UniqueKey(),
      ),
    );
    notifyListeners();
  }

  // It allows me to add a new view to the navigation stack, deleting the navigation that was already saved.
  void _pushNamedAndRemoveUntil({required String name, required Widget page}) {
    _pages.removeWhere((element) => true);
    _pages.add(
      MaterialPage(
        name: name,
        key: UniqueKey(),
        child: page,
      ),
    );
    notifyListeners();
  }

  void _addEventGoBackToList(RouterPageModel routerPageModelParams) {
    if (routerPageModelParams.handled != null) {
      routerPageModels = [routerPageModelParams] + routerPageModels;
    }
  }

  void _activeEventGoBackToList(String keyPage) {
    int indexPage =
        routerPageModels.indexWhere((element) => element.key == keyPage);
    if (indexPage != -1) {
      RouterPageModel routerPage = routerPageModels.removeAt(indexPage);
      if (routerPage.isActive) {
        routerPage.handled!();
      }
    }
  }

  Future<void> setNewRoutePath(PokedexRoutePath pokedexRoutePath) async =>
      _pages.removeWhere((element) => element.name != PagesRoutes.rootPage);
}
