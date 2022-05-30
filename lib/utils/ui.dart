import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


TextStyle get HeadingStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.deepOrangeAccent
    )
  );
}

TextStyle get SubHeadingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.grey[600]
    )
  );
}