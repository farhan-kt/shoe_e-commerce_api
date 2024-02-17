import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_e_commerce/controller/product_provider.dart';
import 'package:shoe_e_commerce/controller/wishlist_provider.dart';
import 'package:shoe_e_commerce/widget/text_widget.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 22, left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textAbel(data: 'WishList', size: 20, weight: FontWeight.bold),
            const SizedBox(height: 20),
            Consumer2<WishListProvider, ProductProvider>(
                builder: (context, wishList, productItem, child) {
              return Container(
                  padding: const EdgeInsets.only(top: 10),
                  decoration: const BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: ListView.builder(
                    itemCount: wishList.wishListItemId.length,
                    itemBuilder: (context, index) {
                      final itemId = wishList.wishListItemId[index];
                      final product = productItem.productList[index];
                      final id = itemId;
                      final allProductIds = productItem.productList
                          .map((product) => product.id)
                          .toList();
                      return Column(
                        children: [
                          Container(
                            height: mediaQuery.height * 0.2,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: const Color(0xFF202020),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Container(
                                  width: mediaQuery.width * .2,
                                  height: mediaQuery.height * .1,
                                  margin: const EdgeInsets.only(right: 5),
                                  child: Image.asset(
                                    'assets/shoe.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      textAbel(
                                          data: 'Product Title',
                                          size: 15,
                                          weight: FontWeight.w300),
                                      textAbel(
                                          data: '\$500',
                                          size: 12,
                                          weight: FontWeight.w200)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ));
            }),
          ],
        ),
      ),
    );
  }
}
