import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textAmaranth({data, weight, size, color}) {
  return Text(data,
      style: GoogleFonts.amaranth(
          fontWeight: weight, fontSize: size, color: color));
}
