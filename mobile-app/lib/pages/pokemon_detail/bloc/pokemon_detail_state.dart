part of 'pokemon_detail_cubit.dart';

class PokemonDetailState {
  final bool isLoading;
  final Pokemon? pokemon;

  PokemonDetailState({required this.isLoading, required this.pokemon});

  factory PokemonDetailState.initial() =>
      PokemonDetailState(isLoading: true, pokemon: null);

  PokemonDetailState copyWith({bool? isLoading, Pokemon? pokemon}) =>
      PokemonDetailState(
          isLoading: isLoading ?? this.isLoading,
          pokemon: pokemon ?? this.pokemon);
}
