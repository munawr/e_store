import 'package:flutter/material.dart';

class SplashScreenProvider extends ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}