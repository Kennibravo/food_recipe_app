import 'package:flutter/material.dart';

var primaryColor = Colors.green;

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Circular',
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.greenAccent,
      ),
      scaffoldBackgroundColor: Colors.grey[200],
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          onPrimary: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(fontSize: 12.0),
        ),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 28.0),
        headline2: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        subtitle1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(fontSize: 12.0),
      ),
    );
  }
}
