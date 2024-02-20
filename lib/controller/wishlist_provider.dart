import 'package:flutter/material.dart';
import 'package:shoe_e_commerce/model/wishlist_model.dart';
import 'package:shoe_e_commerce/service/wishlist_service.dart';

class WishListProvider extends ChangeNotifier {
  final WishListService _wishListService = WishListService();
  List wishListItemId = [];
  String? wishListStatuscode;
  Future<void> addToWishList(
      String productId, String userId, String token) async {
    final product = WishListModel(id: productId);
    await _wishListService.addToWishList(product, userId, token);

    wishListStatuscode = _wishListService.wishListStatuscode;
    notifyListeners();
  }

  Future<void> getWishListProduct(String userId, String token) async {
    final product = WishListModel();
    wishListItemId =
        await _wishListService.getWishListProduct(product, userId, token);
    notifyListeners();
  }

  Future<void> deleteFromWishList(
      String productId, String userId, String token) async {
    await _wishListService.deleteFromWishList(productId, userId, token);
    notifyListeners();
  }
}
