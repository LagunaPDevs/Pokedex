import 'package:flutter/material.dart';

// project imports
import 'package:pokedex/routes/pokedex_route_path.dart';
import 'package:pokedex/routes/route_page_manager.dart';
import 'package:provider/provider.dart';

class PokedexRouterDelegation extends RouterDelegate<PokedexRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PokedexRoutePath> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  PokedexRouterDelegation() {
    _pageManager.addListener(notifyListeners);
  }

  final RoutePageManager _pageManager = RoutePageManager();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _pageManager,
      child: Consumer<RoutePageManager>(
        builder: (context, pageManager, child) {
          return Navigator(
            key: navigatorKey,
            pages: List.of(_pageManager.pages),
            onPopPage: _onPopPage,
          );
        },
      ),
    );
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    _pageManager.didPop(route.settings);
    return true;
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(PokedexRoutePath configuration) async {
    _pageManager.setNewRoutePath(configuration);
  }
}
