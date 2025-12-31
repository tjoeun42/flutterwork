import 'package:flutter/material.dart';

var theme = ThemeData(
    iconTheme: IconThemeData(color: Colors.lightBlue),
    appBarTheme: AppBarTheme(
      color: Colors.grey,
      actionsIconTheme: IconThemeData(color: Colors.purple),
      titleTextStyle: TextStyle(color: Colors.purple, fontSize: 25),
    ),
    textTheme: TextTheme(
        bodyMedium: TextStyle(color: Colors.red, fontSize: 30)
    )
);