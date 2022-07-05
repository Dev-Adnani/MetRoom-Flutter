import 'package:flutter/material.dart';

class ObscureTextUtil with ChangeNotifier {
  bool _isTrue = true;
  bool get isTrue => _isTrue;

  get switchObsIcon {
    return _isTrue
        ? const Icon(Icons.visibility_off)
        : const Icon(Icons.visibility);
  }

  void toggleObs() {
    _isTrue = !_isTrue;
    notifyListeners();
  }
}
