import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = Color.fromARGB(255, 72, 138, 230);

TextStyle dialogTitle = GoogleFonts.tajawal(
  fontSize: 18,
  fontWeight: FontWeight.w700,
);

TextStyle categoristyle = GoogleFonts.tajawal(
  color: Colors.black,
  fontSize: 12,
);
TextStyle categorieslist = GoogleFonts.tajawal(
  fontSize: 17,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);

TextStyle appbar = GoogleFonts.tajawal(
  fontSize: 17,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);
Color secondaryColor = const Color.fromARGB(255, 154, 153, 153);
List<BoxShadow> boxShadow = [
  const BoxShadow(
      offset: Offset(0, 1),
      color: Colors.black12,
      blurRadius: 10,
      spreadRadius: 4)
];