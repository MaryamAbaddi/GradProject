import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Color(0xFF633B48),
      onPrimary: Color.fromARGB(255, 255, 255, 255),
      secondary: Color.fromARGB(255, 255, 255, 255),
      onSecondary: Color(0xFF633B48),
      surface: Color.fromARGB(255, 241, 202, 215),
    ),
  );
}