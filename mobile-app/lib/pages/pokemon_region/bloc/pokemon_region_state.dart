part of 'pokemon_region_cubit.dart';

class PokemonRegionState {
  final bool isLoading;
  final bool expandedAppbar;
  final Color appbarColor;
  final FlutterSecureStorage storage;
  final List<Pokemon> initialList;
  final List<Pokemon> pokemonList;

  PokemonRegionState({
    required this.isLoading,
    required this.expandedAppbar,
    required this.appbarColor,
    required this.storage,
    required this.initialList,
    required this.pokemonList,
  });

  factory PokemonRegionState.initial() => PokemonRegionState(
      isLoading: true,
      expandedAppbar: false,
      appbarColor: PokedexThemeColor.lightGreyColor,
      storage: const FlutterSecureStorage(),
      initialList: [],
      pokemonList: []);

  PokemonRegionState copyWith(
          {bool? isLoading,
          bool? expandedAppbar,
          Color? appbarColor,
          List<Pokemon>? initialList,
          List<Pokemon>? pokemonList}) =>
      PokemonRegionState(
          isLoading: isLoading ?? this.isLoading,
          expandedAppbar: expandedAppbar ?? this.expandedAppbar,
          appbarColor: appbarColor ?? this.appbarColor,
          initialList: initialList ?? this.initialList,
          pokemonList: pokemonList ?? this.pokemonList,
          storage: storage);
}
