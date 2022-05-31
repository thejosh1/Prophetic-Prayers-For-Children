import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


TextStyle get HeadingStyle{
  return GoogleFonts.lato(
    textStyle: const TextStyle(
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
//For the main Page
TextStyle get ListHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.white
      )
  );
}

TextStyle get titleHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w400,
          color: Colors.grey[600]
      )
  );
}

TextStyle get listHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.white
      )
  );
}

TextStyle get textHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.black
      )
  );
}