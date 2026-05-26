import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Color.fromARGB(255, 86, 31, 31),
      onPrimary: Color.fromARGB(255, 255, 255, 255),
      secondary: Color.fromARGB(255, 255, 255, 255),
      onSecondary: Color.fromARGB(255, 86, 31, 31),
      surface: Color.fromARGB(255, 241, 202, 215),

    ),
  );

static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Color.fromARGB(255, 180, 80, 100),
      onPrimary: Color.fromARGB(255, 255, 255, 255),
      secondary: Color.fromARGB(255, 50, 30, 30),
      onSecondary: Color.fromARGB(255, 240, 200, 210),
      surface: Color.fromARGB(255, 28, 18, 18),
    ),
  );
}