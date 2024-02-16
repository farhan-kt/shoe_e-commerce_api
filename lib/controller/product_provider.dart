import 'package:flutter/material.dart';
import 'package:shoe_e_commerce/model/product_model.dart';
import 'package:shoe_e_commerce/service/product_service.dart';

class ProductProvider extends ChangeNotifier {
  ProductService apiService = ProductService();
  List<ProductModel> productList = [];

  getData() async {
    try {
      productList = await apiService.getData();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
