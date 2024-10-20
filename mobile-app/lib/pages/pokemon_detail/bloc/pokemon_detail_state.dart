part of 'pokemon_detail_cubit.dart';

class PokemonDetailState {
  final bool isLoading;
  final bool isCaptured;
  final Pokemon? pokemon;
  final FlutterSecureStorage storage;

  PokemonDetailState(
      {required this.isLoading,
      required this.isCaptured,
      required this.pokemon,
      required this.storage});

  factory PokemonDetailState.initial() => PokemonDetailState(
      isLoading: true,
      isCaptured: false,
      pokemon: null,
      storage: const FlutterSecureStorage());

  PokemonDetailState copyWith(
          {bool? isLoading, bool? isCaptured, Pokemon? pokemon}) =>
      PokemonDetailState(
          isLoading: isLoading ?? this.isLoading,
          isCaptured: isCaptured ?? this.isCaptured,
          pokemon: pokemon ?? this.pokemon,
          storage: storage);
}
