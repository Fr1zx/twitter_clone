import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
    primaryColor: Color.fromARGB(255, 69, 171, 255),
    scaffoldBackgroundColor: Color.fromARGB(255, 232, 245, 255),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 69, 171, 255),
      onPrimary: Colors.white,
      secondary: Color.fromARGB(255, 15, 122, 210),
      onSecondary: Colors.white,
      error: Colors.redAccent,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    cardColor: Colors.white,
    textTheme: TextTheme(
      labelLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      titleLarge: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
      titleMedium: TextStyle(fontSize: 20),
    ),

    iconTheme: IconThemeData(color: Color.fromARGB(255, 123, 127, 129)),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 22, 22, 22),
    primaryColor: Color.fromARGB(255, 69, 171, 255),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromARGB(255, 69, 171, 255),
      onPrimary: Colors.white,
      secondary: Color.fromARGB(255, 15, 122, 210),
      onSecondary: Colors.white,
      error: Colors.redAccent,
      onError: Colors.white,
      surface: const Color.fromARGB(255, 35, 35, 36),
      onSurface: const Color.fromARGB(255, 234, 234, 234),
    ),
    cardColor: const Color.fromARGB(255, 35, 35, 36),
    textTheme: TextTheme(
      labelLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      titleLarge: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
      titleMedium: TextStyle(fontSize: 20),
    ),
    iconTheme: IconThemeData(color: Color.fromARGB(255, 123, 127, 129)),
  );
}
