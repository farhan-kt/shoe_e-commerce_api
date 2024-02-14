import 'package:flutter/material.dart';
import 'package:shoe_e_commerce/widget/text_widget.dart';
import 'package:shoe_e_commerce/widget/wishlist_item.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 22, left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textAbel(data: 'WishList', size: 20, weight: FontWeight.bold),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  decoration: const BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const WishListItem();
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
