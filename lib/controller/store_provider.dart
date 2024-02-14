import 'package:flutter/material.dart';
import 'package:shoe_e_commerce/service/store_service.dart';

class StoreProvider extends ChangeNotifier {
  StoreService store = StoreService();
  setKeys(key, tokenId) async {
    await store.setKeys(key, tokenId);
    notifyListeners();
  }

  getValues(key) async {
    return store.getValues(key);
  }

  clearValues() async {
    await store.clearValues();
    notifyListeners();
  }
}
