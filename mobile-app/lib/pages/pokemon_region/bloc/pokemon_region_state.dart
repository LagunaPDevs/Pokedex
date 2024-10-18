part of 'pokemon_region_cubit.dart';

class PokemonRegionState {
  final bool isLoading;
  final List<Pokemon> initialList;
  final List<Pokemon> pokemonList;

  PokemonRegionState({
    required this.isLoading,
    required this.initialList,
    required this.pokemonList,
  });

  factory PokemonRegionState.initial() =>
      PokemonRegionState(isLoading: true, initialList: [], pokemonList: []);

  PokemonRegionState copyWith(
          {bool? isLoading,
          List<Pokemon>? initialList,
          List<Pokemon>? pokemonList}) =>
      PokemonRegionState(
          isLoading: isLoading ?? this.isLoading,
          initialList: initialList ?? this.initialList,
          pokemonList: pokemonList ?? this.pokemonList);
}
