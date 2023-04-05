import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CategoryProvider with ChangeNotifier {
  List<dynamic> _categories = [];
  bool _isLoading = false;

  List<dynamic> get categories => _categories;

  bool get isLoading => _isLoading;

  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('https://dummyjson.com/products/categories');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = response.body;
      _categories = jsonDecode(jsonResponse);
    } else {
      throw Exception('Failed to load category data');
    }

    _isLoading = false;
    notifyListeners();
  }
}
