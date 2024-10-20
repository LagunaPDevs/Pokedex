import 'package:flutter/material.dart';

// external libraries
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit() : super(RootState.initial());

  Future<void> init(BuildContext context) async {
    emit(state.copyWith(isLoading: false));
  }

  changePage(int index) {
    state.pageController.jumpToPage(index);
    emit(state.copyWith(pageIndex: index));
  }
}
