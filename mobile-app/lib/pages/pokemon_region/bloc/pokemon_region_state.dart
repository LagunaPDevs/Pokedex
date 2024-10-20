part of 'pokemon_region_cubit.dart';

class PokemonRegionState {
  final bool isLoading;
  final bool expandedAppbar;
  final List<Pokemon> initialList;
  final List<Pokemon> pokemonList;

  PokemonRegionState({
    required this.isLoading,
    required this.expandedAppbar,
    required this.initialList,
    required this.pokemonList,
  });

  factory PokemonRegionState.initial() => PokemonRegionState(
      isLoading: true, expandedAppbar: false, initialList: [], pokemonList: []);

  PokemonRegionState copyWith(
          {bool? isLoading,
          bool? expandedAppbar,
          List<Pokemon>? initialList,
          List<Pokemon>? pokemonList}) =>
      PokemonRegionState(
          isLoading: isLoading ?? this.isLoading,
          expandedAppbar: expandedAppbar ?? this.expandedAppbar,
          initialList: initialList ?? this.initialList,
          pokemonList: pokemonList ?? this.pokemonList);
}
