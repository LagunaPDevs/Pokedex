part of 'captured_pokemons_cubit.dart';

enum CapturedPokemonsFilterBy { byId, byName, byType }

class CapturedPokemonsState {
  final bool isLoading;
  final bool expandedAppbar;
  final Color appbarColor;
  final FlutterSecureStorage storage;
  final List<Pokemon> initialCapturedList;
  final List<Pokemon> capturedList;
  final List<CapturedPokemonsFilterBy> filtersList;
  final CapturedPokemonsFilterBy selectedFilter;
  final List<String> pokemonTypes;

  CapturedPokemonsState({
    required this.isLoading,
    required this.expandedAppbar,
    required this.appbarColor,
    required this.storage,
    required this.initialCapturedList,
    required this.capturedList,
    required this.filtersList,
    required this.selectedFilter,
    required this.pokemonTypes,
  });

  factory CapturedPokemonsState.initial() => CapturedPokemonsState(
      isLoading: true,
      expandedAppbar: false,
      appbarColor: PokedexThemeColor.lightGreyColor,
      storage: const FlutterSecureStorage(),
      initialCapturedList: [],
      capturedList: [],
      filtersList: CapturedPokemonsFilterBy.values,
      selectedFilter: CapturedPokemonsFilterBy.byId,
      pokemonTypes: []);

  CapturedPokemonsState copyWith(
          {bool? isLoading,
          bool? expandedAppbar,
          Color? appbarColor,
          List<Pokemon>? initialCapturedList,
          List<Pokemon>? capturedList,
          CapturedPokemonsFilterBy? selectedFilter,
          List<String>? pokemonTypes}) =>
      CapturedPokemonsState(
          isLoading: isLoading ?? this.isLoading,
          expandedAppbar: expandedAppbar ?? this.expandedAppbar,
          appbarColor: appbarColor ?? this.appbarColor,
          storage: storage,
          initialCapturedList: initialCapturedList ?? this.initialCapturedList,
          capturedList: capturedList ?? this.capturedList,
          filtersList: filtersList,
          selectedFilter: selectedFilter ?? this.selectedFilter,
          pokemonTypes: pokemonTypes ?? this.pokemonTypes);
}
