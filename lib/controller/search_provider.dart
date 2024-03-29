import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_e_commerce/controller/product_provider.dart';
import 'package:shoe_e_commerce/model/product_model.dart';
import 'package:shoe_e_commerce/service/product_service.dart';

class SearchProvider extends ChangeNotifier {
  ProductService productService = ProductService();
  TextEditingController searchController = TextEditingController();
  List<ProductModel> searchedList = [];

  void search(String enterName, context) {
    final getProductProvider =
        Provider.of<ProductProvider>(context, listen: false);
    if (enterName.isEmpty) {
      searchedList = [];
    } else {
      searchedList = getProductProvider.productList
          .where((ProductModel product) =>
              product.title!.toLowerCase().contains(enterName.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
