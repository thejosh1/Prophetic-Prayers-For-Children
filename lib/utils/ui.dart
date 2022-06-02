import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prophetic_prayers_for_children/utils/dimensions.dart';


TextStyle get HeadingStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: Dimensions.width30,
      fontWeight: FontWeight.bold,
      color: Colors.deepOrangeAccent
    )
  );
}

TextStyle get SubHeadingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: Dimensions.size14,
      fontWeight: FontWeight.w400,
      color: Colors.grey[600]
    )
  );
}
//For the main Page
TextStyle get ListHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: Dimensions.size14,
          fontWeight: FontWeight.w400,
          color: Colors.white
      )
  );
}

TextStyle get titleHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: Dimensions.width30,
          fontWeight: FontWeight.w400,
          color: Colors.grey[600]
      )
  );
}

TextStyle get listHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: Dimensions.width20,
          fontWeight: FontWeight.w400,
          color: Colors.white
      )
  );
}

TextStyle get textHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: Dimensions.width20,
          fontWeight: FontWeight.w400,
          color: Colors.black
      )
  );
}