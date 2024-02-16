import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_e_commerce/controller/product_provider.dart';
import 'package:shoe_e_commerce/model/product_model.dart';
import 'package:shoe_e_commerce/service/product_service.dart';

class SearchProvider extends ChangeNotifier {
  ProductService productService = ProductService();
  TextEditingController searchController = TextEditingController();
  List<ProductModel> searchedList = [];
  loadProducts() async {
    final allData = await productService.getData();
    searchedList = allData;
    notifyListeners();
  }

  search(String enterName, context) {
    final getProductProvider =
        Provider.of<ProductProvider>(context, listen: false);
    if (enterName.isEmpty) {
      searchedList = [...getProductProvider.productList];
    } else {
      searchedList = getProductProvider.productList
          .where((ProductModel product) =>
              product.title!.toLowerCase().contains(enterName.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
