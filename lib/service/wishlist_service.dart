import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shoe_e_commerce/model/wishlist_model.dart';

class WishListService {
  Dio dio = Dio();
  String? wishListStatuscode;
  addToWishList(WishListModel product, String userId, String token) async {
    final url = 'http://localhost:3000/api/users/$userId/wishlist';

    try {
      Response response = await dio.post(
        url,
        data: product.toJson(token)['data'],
        options: Options(
          headers: product.toJson(token)['headers'],
        ),
      );

      if (response.statusCode == 200) {
        wishListStatuscode = '200';
        log('Product added to WishList');
      } else if (response.statusCode == 500) {
        log('Unsuccessful. Status code: ${response.statusCode}');
        log('Response data: ${response.data}');
      }
    } catch (e) {
      log('ErrorFromToWishList: $e');
      wishListStatuscode = '500';
    }
  }

  getWishListProduct(WishListModel product, String userId, String token) async {
    final url = 'http://localhost:3000/api/users/$userId/wishlist';

    try {
      Response response = await dio.get(
        url,
        options: Options(
          headers: product.toJson(token)['headers'],
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> productId = response.data['data'] as List;

        return productId;
      } else {
        log('Unsuccessful. Status code: ${response.statusCode}');
        log('Response data: ${response.data}');
        throw Exception('Failed to fetch wishlist');
      }
    } catch (e) {
      // log('Error: $e');
      rethrow;
    }
  }
}
