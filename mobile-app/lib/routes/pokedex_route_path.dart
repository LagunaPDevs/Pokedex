// This class is used for future authentication
class PokedexRoutePath {
  late bool _authenticated;

  PokedexRoutePath.auth() : _authenticated = false;

  PokedexRoutePath.menu(bool autentication) : _authenticated = autentication;

  bool get isRootPage => _authenticated == false;
  bool get isRegionPage => _authenticated != false;

  static PokedexRoutePath parse(String url) {
    final uri = Uri.parse(url);

    // path: /
    if (uri.path.isEmpty) {
      return PokedexRoutePath.auth();
    }

    // path: /menuPage
    if (uri.pathSegments.length == 1 && uri.pathSegments.first == "menuPage") {
      return PokedexRoutePath.menu(true);
    }
    return PokedexRoutePath.auth();
  }
}
