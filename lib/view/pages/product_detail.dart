// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoe_e_commerce/widget/normal_widgets.dart';

class ProductDetailScreen extends StatelessWidget {
  final title;
  final description;
  final category;
  final price;
  final image;
  const ProductDetailScreen(
      {super.key,
      this.title,
      this.description,
      this.category,
      this.price,
      this.image});

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            Center(
              child: Card(
                elevation: 5,
                child: Container(
                  height: mediaQuery.height * 0.23,
                  width: mediaQuery.width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: image, fit: BoxFit.cover),
                      color: Colors.grey[500]),
                ),
              ),
            ),
            SizedBox(height: mediaQuery.height * 0.06),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Brand : ',
                      style: GoogleFonts.abel(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Text(
                      title,
                      style: GoogleFonts.abel(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.yellow,
                          letterSpacing: 5),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Category : ',
                      style: GoogleFonts.abel(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Text(
                      category,
                      style: GoogleFonts.abel(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.yellow,
                          letterSpacing: 5),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Price : ₹',
                      style: GoogleFonts.abel(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Text(
                      price.toString(),
                      style: GoogleFonts.abel(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.yellow,
                          letterSpacing: 5),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: mediaQuery.height * 0.25,
                  width: mediaQuery.width * double.infinity,
                  child: Card(
                      elevation: 5,
                      child: productDetails(
                          hint: 'Description :', value: description)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
