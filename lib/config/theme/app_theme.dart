import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
      scaffoldBackgroundColor: const Color(0xFFEFEFEF),
      useMaterial3: true,
      colorSchemeSeed: const Color(0xFF97ce4c),
      fontFamily: 'Georgia',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
        displayMedium: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
        displaySmall: TextStyle(fontSize: 24, color: Colors.white),
        bodyLarge: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
        bodyMedium: TextStyle(
            fontSize: 12.0, fontWeight: FontWeight.w200, color: Colors.white),
        bodySmall: TextStyle(
            fontSize: 11.0, fontWeight: FontWeight.w100, color: Colors.grey),
      ));
}
