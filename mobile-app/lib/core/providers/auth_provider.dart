import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  bool _loadingFinished = false;
  bool get loadingFinished => _loadingFinished;

  set loadingFinished(bool isFinished) {
    _loadingFinished = isFinished;
    notifyListeners();
  }
}
