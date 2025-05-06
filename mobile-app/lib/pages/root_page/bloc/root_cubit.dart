import 'package:flutter/material.dart';

import 'package:pokedex/core/constants/storage_constants.dart';

// external libraries
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit() : super(RootState.initial());

  Future<void> init(BuildContext context) async {
    await cleanPrevInstallationsStorage();
    emit(state.copyWith(isLoading: false));
  }

  changePage(int index) {
    state.pageController.jumpToPage(index);
    emit(state.copyWith(pageIndex: index));
  }

  Future<void> cleanPrevInstallationsStorage() async {
    try {
      const secureStorage = FlutterSecureStorage();
      final prefs = await SharedPreferences.getInstance();
      if (prefs.getBool(StorageConstants.firstRun) ?? true) {
        await secureStorage.deleteAll();
        prefs.setBool(StorageConstants.firstRun, false);
      }
    } catch (e) {
      print(e);
    }
  }
}
