part of 'captured_pokemons_cubit.dart';

class CapturedPokemonsState {
  final bool isLoading;
  final FlutterSecureStorage storage;
  final List<Pokemon> initialCapturedList;
  final List<Pokemon> capturedList;

  CapturedPokemonsState(
      {required this.isLoading,
      required this.storage,
      required this.initialCapturedList,
      required this.capturedList});

  factory CapturedPokemonsState.initial() => CapturedPokemonsState(
      isLoading: true,
      storage: const FlutterSecureStorage(),
      initialCapturedList: [],
      capturedList: []);

  CapturedPokemonsState copyWith(
          {bool? isLoading,
          List<Pokemon>? initialCapturedList,
          List<Pokemon>? capturedList}) =>
      CapturedPokemonsState(
          isLoading: isLoading ?? this.isLoading,
          storage: storage,
          initialCapturedList: initialCapturedList ?? this.initialCapturedList,
          capturedList: capturedList ?? this.capturedList);
}
