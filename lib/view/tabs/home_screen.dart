// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shoe_e_commerce/controller/product_provider.dart';
import 'package:shoe_e_commerce/controller/search_provider.dart';
import 'package:shoe_e_commerce/model/wishlist_model.dart';
import 'package:shoe_e_commerce/view/pages/cart_screen.dart';
import 'package:shoe_e_commerce/view/pages/product_detail.dart';
import 'package:shoe_e_commerce/widget/home_gridview_container.dart';
import 'package:shoe_e_commerce/widget/home_widgets.dart';
import 'package:shoe_e_commerce/widget/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    Provider.of<ProductProvider>(context, listen: false).getData();
    Size mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  searchTextFormField(
                      onChanged: (value) => searchProvider.search(
                          searchProvider.searchController.text, context),
                      controller: searchProvider.searchController),
                  const SizedBox(width: 10),
                  cartIconContainer(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                    },
                  )
                ],
              ),
              const SizedBox(height: 20),
              textAmaranth(data: 'HOME', size: 30, weight: FontWeight.w700),
              const SizedBox(height: 10),
              Expanded(
                child: Consumer2<SearchProvider, ProductProvider>(
                  builder: (context, searchValue, productValue, child) {
                    if (searchValue.searchedList.isEmpty &&
                        searchProvider.searchController.text.isNotEmpty) {
                      return Center(
                          child: Lottie.asset(
                              'assets/Animation - empty search item.json'));
                    } else if (searchValue.searchedList.isEmpty) {
                      if (productValue.productList.isNotEmpty) {
                        final allProducts = productValue.productList;
                        return GridView.builder(
                          gridDelegate: gridDelegate(mediaQuery.width * 0.0018),
                          itemCount: allProducts.length,
                          itemBuilder: (context, index) {
                            final product = allProducts[index];
                            final wishProduct = WishListModel(
                              id: product.id,
                            );
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailScreen(
                                        image: NetworkImage(
                                            product.image.toString()),
                                        category: product.category,
                                        description: product.description,
                                        title: product.title,
                                        price: product.price),
                                  ),
                                );
                              },
                              child: ProductContainer(
                                product: product,
                                productId: wishProduct,
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(
                            child: textAbel(
                                data: 'NO ITEMS ADDED',
                                size: 20,
                                weight: FontWeight.w700));
                      }
                    } else {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: mediaQuery.width * 0.0018,
                        ),
                        itemCount: searchValue.searchedList.length,
                        itemBuilder: (context, index) {
                          final product = searchValue.searchedList[index];

                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailScreen(
                                        image: NetworkImage(
                                            product.image.toString()),
                                        category: product.category,
                                        description: product.description,
                                        title: product.title,
                                        price: product.price),
                                  ),
                                );
                              },
                              child: ProductContainer(product: product));
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
