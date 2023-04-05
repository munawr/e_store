import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../Models.dart/ProductsModel.dart';

class ProductsProvider with ChangeNotifier {
  Product? _products;
  bool _isLoading1 = false;

  Product? get products => _products;
  bool get isLoading1 => _isLoading1;
  Future<void> fetchProducts({required String categoryName}) async {
    _isLoading1 = true;
    notifyListeners();

    final url =
        Uri.parse('https://dummyjson.com/products/category/$categoryName');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      _products = Product.fromJson(jsonResponse);
      _isLoading1 = false;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
