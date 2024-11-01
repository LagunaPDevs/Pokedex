import 'package:flutter/material.dart';
// external libraries
import 'package:provider/provider.dart';

// project imports
import 'package:pokedex/pages/loading/presentation/loading_page.dart';
import 'package:pokedex/pages/pokemon_detail/presentation/pokemon_detail.dart';
import 'package:pokedex/routes/pages_routes.dart';
import 'package:pokedex/routes/pokedex_route_path.dart';
import 'package:pokedex/routes/router_page_model.dart';

class RoutePageManager extends ChangeNotifier {
  static RoutePageManager of(BuildContext context) =>
      Provider.of<RoutePageManager>(context, listen: false);

  List<RouterPageModel> _routerPageModels = [];

  final List<Page> _pages = [
    MaterialPage(
        name: PagesRoutes.rootPage,
        key: UniqueKey(),
        child: const LoadingPage())
  ];

  List<Page> get pages => List.unmodifiable(_pages);
  List<RouterPageModel> get routerPageModels => _routerPageModels;

  PokedexRoutePath get currentPath => PokedexRoutePath.parse(_pages.last.name!);

  // var setter
  set routerPageModels(List<RouterPageModel>? routerPageModels) =>
      _routerPageModels = routerPageModels ?? _routerPageModels;

  // open PokemonDetail page
  void openPokemonDetail({Function? handleGoBack, required int id}) =>
      _pushName(
          name: PagesRoutes.pokemonDetailPage,
          handledGoBack: handleGoBack,
          page: PokemonDetail(pokemonId: id));

  // remove page from the stack
  void didPop(RouteSettings page) {
    _pages.removeWhere((element) => (element.name == page.name));
    _activeEventGoBackToList(page.name!);
    notifyListeners();
  }

  // private navigation methods
  // allows me to add a new view to the navigation stack, without affecting the
  // navigation that comes in the queue
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

  // It allows me to add a new view to the navigation stack, deleting the
  // navigation that was already saved.
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

  // Used to execute an event after deleting a page from the stack.
  // It is added to the page has been recently added to the stack.
  void _addEventGoBackToList(RouterPageModel routerPageModelParams) {
    if (routerPageModelParams.handled != null) {
      routerPageModels = [routerPageModelParams] + routerPageModels;
    }
  }

  // Triggers an event when a page has been deleted from the stack.
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

  // Delete all pages from the stack except for the root one
  Future<void> setNewRoutePath(PokedexRoutePath pokedexRoutePath) async =>
      _pages.removeWhere((element) => element.name != PagesRoutes.rootPage);
}
