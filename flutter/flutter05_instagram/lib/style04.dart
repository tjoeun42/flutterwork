import 'package:flutter/material.dart';

var theme = ThemeData(
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: Colors.amber
    )
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.lightGreen,
      foregroundColor: Colors.pink,   // 글자색 변경
      textStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      )
    )
  ),

  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.pink, fontSize: 30),
    bodyLarge: TextStyle(color: Colors.cyan)
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xfff3edf7),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
  ),

);