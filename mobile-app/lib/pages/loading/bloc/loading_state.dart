part of 'loading_cubit.dart';

class LoadingState {
  final bool isLoading;
  final FlutterSecureStorage storage;

  const LoadingState({
    required this.isLoading,
    required this.storage,
  });

  factory LoadingState.initial() =>
      const LoadingState(isLoading: true, storage: FlutterSecureStorage());

  LoadingState copyWith({bool? isLoading, themeProvider}) => LoadingState(
        isLoading: isLoading ?? this.isLoading,
        storage: storage,
      );
}
