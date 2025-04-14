import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      bodyText2: TextStyle(fontSize: 16),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
      headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      bodyText2: TextStyle(fontSize: 16),
    ),
  );
}