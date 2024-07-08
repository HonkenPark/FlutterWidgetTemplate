import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: Colors.indigo,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.grey),
  ),
  useMaterial3: true,
);

enum ColorSeed {
  primaryAmber(Color(0xFFF5BA5E)),
  primaryWindAmber(Color(0xFFFFCB74)),
  darkGreyTextSplash(Color(0xFF484848)),
  lightGreyBgSplash(Color(0xFFE9E9E9)),
  greyHomeBannerTitle(Color(0xFF929292)),
  darkGreyIcon(Color(0xFF313030)),
  shadowColor(Color(0xFF999999)),
  grayLogoColor(Color(0xFFCDCDCD)),
  topGradient(Color(0xFFFDFDFD)),
  bottomGradient(Color(0xFFE9E9E9)),
  errorBgSnackBar(Color(0xFFDB5950)),
  cardBackgroundWhite(Color(0xFFFFFEF9));

  const ColorSeed(this.color);
  final Color color;
}

List<Shadow> shadowEffect = [
  Shadow(
    color: ColorSeed.shadowColor.color,
    offset: const Offset(0.5, 0.5),
    blurRadius: 1.5,
  )
];

List<Color> splashGradient = [
  Colors.white,
  Colors.white,
  Colors.white,
  ColorSeed.topGradient.color,
  ColorSeed.bottomGradient.color,
];
