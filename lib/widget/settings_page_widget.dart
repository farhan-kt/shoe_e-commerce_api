import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget settingPageCard(String text, IconData icon) {
  return Card(
    elevation: 5,
    margin: const EdgeInsets.all(10),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
          ),
          Icon(
            icon,
          )
        ],
      ),
    ),
  );
}
