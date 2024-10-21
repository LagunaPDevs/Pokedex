import 'package:flutter/material.dart';
// external libraries
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'loading_state.dart';

class LoadingCubit extends Cubit<LoadingState> {
  LoadingCubit() : super(LoadingState.initial());

  Future<void> init(BuildContext context) async {
    emit(state.copyWith(isLoading: false));
  }
}
