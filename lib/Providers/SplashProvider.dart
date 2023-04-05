import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreenProvider extends ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}