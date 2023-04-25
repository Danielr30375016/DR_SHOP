import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.yellow,
  );

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark, scaffoldBackgroundColor: Colors.blue);
}
