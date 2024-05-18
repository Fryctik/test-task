import 'package:flutter/material.dart';

final theme = ThemeData(
  textTheme: createTextTheme(),
  colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 186, 132, 246)),
  useMaterial3: true,
);



abstract class AppColors {
  static const accent = Color.fromARGB(255, 175, 222, 46);
  static const accentDark = Color.fromARGB(255, 145, 193, 14);
  static const main = Color.fromARGB(255, 186, 132, 246);
  static const mainDark = Color.fromARGB(255, 143, 66, 227);
  static const mainSoft = Color.fromARGB(255, 230, 216, 246);
  static const shade1 = Color.fromARGB(255, 239, 242, 245);
  static const shade2 = Color.fromARGB(255, 181, 186, 192);
  static const shade3 = Color.fromARGB(255, 130, 133, 137);
  static const black = Color.fromARGB(255, 22, 21, 23);
  static const white = Color.fromARGB(255, 255, 255, 255);
  static const red = Color.fromARGB(255, 221, 34, 34);
  static const softRed = Color.fromARGB(255, 245, 210, 210);
  static const yellow = Color.fromARGB(255, 215, 186, 34);
}

TextTheme createTextTheme() {
  return const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'Unbounded',
      fontSize: 32,
      height: 40 / 32,
      fontWeight: FontWeight.w600
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Unbounded',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 22 / 16,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Geologica',
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 20 / 16,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Geologica',
      fontSize: 16,
      fontWeight: FontWeight.w300,
      height: 20 / 16,
    ),
    displayLarge: TextStyle(
      fontFamily: 'Geologica',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 18 / 14,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Geologica',
      fontSize: 14,
      fontWeight: FontWeight.w300,
      height: 18 / 14,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Geologica',
      fontSize: 11,
      fontWeight: FontWeight.w400,
      height: 16 / 14,
    )
  );
}