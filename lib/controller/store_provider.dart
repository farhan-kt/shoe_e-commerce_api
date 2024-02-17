import 'package:flutter/material.dart';
import 'package:shoe_e_commerce/service/store_service.dart';

class StoreProvider extends ChangeNotifier {
  StoreService store = StoreService();

  Future<dynamic> getValues(key) async {
    return store.getValues(key);
  }

  void clearValues() async {
    await store.clearValues();
    notifyListeners();
  }
}
