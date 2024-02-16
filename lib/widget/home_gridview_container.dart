// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {
  final product;

  const ProductContainer({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: mediaQuery.size.width * 0.3,
              width: mediaQuery.size.width * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(
                    product.image.toString(),
                  ),
                ),
              ),
            ),
          ),
          Text(
            product.title ?? 'Unknown',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            product.category ?? 'Unknown',
            style: TextStyle(
              color: product.category == 'men' ? Colors.blue : Colors.pink,
              fontSize: 12,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹ ${product.price.toString()}',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline,
                  color: Colors.black,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
