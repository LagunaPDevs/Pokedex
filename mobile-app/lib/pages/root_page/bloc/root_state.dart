part of 'root_cubit.dart';

class RootState {
  final bool isLoading;
  final int pageIndex;
  final int firstPage;
  final PageController pageController;
  final FlutterSecureStorage storage;

  const RootState(
      {required this.isLoading,
      required this.pageIndex,
      required this.firstPage,
      required this.pageController,
      required this.storage});

  factory RootState.initial() => RootState(
      isLoading: true,
      pageIndex: 0,
      firstPage: 0,
      pageController: PageController(initialPage: 0),
      storage: const FlutterSecureStorage());

  RootState copyWith({bool? isLoading, int? pageIndex, int? firstPage}) =>
      RootState(
          isLoading: isLoading ?? this.isLoading,
          pageIndex: pageIndex ?? this.pageIndex,
          firstPage: firstPage ?? this.firstPage,
          pageController: pageController,
          storage: storage);
}
