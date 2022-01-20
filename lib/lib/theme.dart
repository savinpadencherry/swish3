import 'package:flutter/material.dart';
import 'package:swish/lib/constants.dart';

class Themes {
  static final light = ThemeData(
    primaryColor: primaryClr,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}

// font style

TextStyle get h1 {
  return TextStyle(
    fontFamily: 'Montserrat-Bold',
    fontWeight: FontWeight.w700,
    fontSize: 28,
  );
}

TextStyle get h2 {
  return TextStyle(
    fontFamily: 'Montserrat-Bold',
    fontWeight: FontWeight.w700,
    fontSize: 24,
  );
}

TextStyle get h3 {
  return TextStyle(
    fontFamily: 'Montserrat-Bold',
    fontWeight: FontWeight.w700,
    fontSize: 18,
  );
}

TextStyle get h4 {
  return TextStyle(
    fontFamily: 'Montserrat-Bold',
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );
}

TextStyle get h5 {
  return TextStyle(
    fontFamily: 'Montserrat-SemiBold',
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
}

TextStyle get h6 {
  return TextStyle(
    fontFamily: 'Montserrat-SemiBold',
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
}

TextStyle get h7 {
  return TextStyle(
    fontFamily: 'Montserrat-Bold',
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );
}

TextStyle get subHead1 {
  return TextStyle(
    fontFamily: 'Nunito-ExtraBold',
    fontWeight: FontWeight.w800,
    fontSize: 18,
  );
}

TextStyle get subHead2 {
  return TextStyle(
    fontFamily: 'Nunito-Bold',
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );
}

TextStyle get subHead3 {
  return TextStyle(
    fontFamily: 'Nunito-SemiBold',
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
}

TextStyle get body1 {
  return TextStyle(
    fontFamily: 'Nunito-SemiBold',
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
}

TextStyle get body2 {
  return TextStyle(
    fontFamily: 'Nunito-Regular',
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
}

TextStyle get body3 {
  return TextStyle(
    fontFamily: 'Nunito-SemiBold',
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
}

TextStyle get badge {
  return TextStyle(
    fontFamily: 'Nunito-ExtraBold',
    fontWeight: FontWeight.w800,
    fontSize: 12,
  );
}
