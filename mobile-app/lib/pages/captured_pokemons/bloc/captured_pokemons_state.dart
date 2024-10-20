part of 'captured_pokemons_cubit.dart';

enum CapturedPokemonsFilterBy { byId, byName, byType }

class CapturedPokemonsState {
  final bool isLoading;
  final bool expandedAppbar;
  final FlutterSecureStorage storage;
  final List<Pokemon> initialCapturedList;
  final List<Pokemon> capturedList;
  final List<CapturedPokemonsFilterBy> filtersList;
  final CapturedPokemonsFilterBy selectedFilter;

  CapturedPokemonsState({
    required this.isLoading,
    required this.expandedAppbar,
    required this.storage,
    required this.initialCapturedList,
    required this.capturedList,
    required this.filtersList,
    required this.selectedFilter,
  });

  factory CapturedPokemonsState.initial() => CapturedPokemonsState(
      isLoading: true,
      expandedAppbar: false,
      storage: const FlutterSecureStorage(),
      initialCapturedList: [],
      capturedList: [],
      filtersList: CapturedPokemonsFilterBy.values,
      selectedFilter: CapturedPokemonsFilterBy.byId);

  CapturedPokemonsState copyWith(
          {bool? isLoading,
          bool? expandedAppbar,
          List<Pokemon>? initialCapturedList,
          List<Pokemon>? capturedList,
          CapturedPokemonsFilterBy? selectedFilter}) =>
      CapturedPokemonsState(
          isLoading: isLoading ?? this.isLoading,
          expandedAppbar: expandedAppbar ?? this.expandedAppbar,
          storage: storage,
          initialCapturedList: initialCapturedList ?? this.initialCapturedList,
          capturedList: capturedList ?? this.capturedList,
          filtersList: filtersList,
          selectedFilter: selectedFilter ?? this.selectedFilter);
}
