import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff14A8E5),
    primary: const Color.fromARGB(255, 20, 120, 243),
    secondary: const Color(0xff7BCFC7),
    tertiary: const Color(0xff60A5FA),
    outline: Colors.black,
  ),
  fontFamily: GoogleFonts.poppins().fontFamily,
  textTheme: TextTheme(
    displayLarge: const TextStyle(
      fontSize: 50.0,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: const TextStyle(
      fontSize: 45.0,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: const TextStyle(
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: const TextStyle(
      fontSize: 48.0,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: const TextStyle(
      fontSize: 44.0,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: const TextStyle(
      fontSize: 38.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    // Text for primary buttons
    labelLarge: const TextStyle(
      fontSize: 20.0,
      color: Colors.white,
    ),
    labelMedium: const TextStyle(
      fontSize: 18.0,
    ),
    labelSmall: TextStyle(
      fontSize: 16.0,
      color: Colors.white.withOpacity(0.85),
      fontWeight: FontWeight.w500,
      wordSpacing: 0.8,
    ),
    titleMedium: TextStyle(
      fontSize: 14.0,
      color: Colors.grey[600],
    ),
    titleLarge: const TextStyle(
      fontSize: 27.0,
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: const TextStyle(
      fontSize: 18.0,
      color: Colors.black45,
    ),
  ),
);
