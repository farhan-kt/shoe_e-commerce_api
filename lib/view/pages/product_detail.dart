import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: Column(
        children: [
          Container(
            height: mediaQuery.height * 0.4,
            width: mediaQuery.width * double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(image: image, fit: BoxFit.cover)),
          ),
          Column(
            children: [
              Text(
                title,
                style: GoogleFonts.abel(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.yellow),
              ),
              Text(category,
                  style: GoogleFonts.aBeeZee(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  )),
              Text(description,
                  style: GoogleFonts.aBeeZee(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  )),
              Text(price.toString(),
                  style: GoogleFonts.aBeeZee(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
