import 'package:flutter/material.dart';

var lightThemeData = ThemeData(
  primarySwatch: Colors.blueGrey,
  backgroundColor: Colors.white,
  cardColor: Colors.blueGrey[300],
  primaryTextTheme: TextTheme(
    overline: TextStyle(
      color: Colors.blueGrey[800],
      decorationColor: Colors.blueGrey[800],
    ),
    button: TextStyle(
      color: Colors.blueGrey[800],
      decorationColor: Colors.blueGrey[800],
    ),
  ),
  bottomAppBarColor: Colors.blueGrey[500],
  iconTheme: const IconThemeData(color: Colors.blueGrey),
  brightness: Brightness.light,
);

var darkThemeData = ThemeData(
  primarySwatch: Colors.blueGrey,
  backgroundColor: Colors.blueGrey[900],
  cardColor: Colors.black,
  primaryTextTheme: TextTheme(
    overline: TextStyle(
      color: Colors.blueGrey[200],
      decorationColor: Colors.blueGrey[800],
    ),
    button: TextStyle(
      color: Colors.blueGrey[200],
      decorationColor: Colors.blueGrey[50],
    ),
  ),
  bottomAppBarColor: Colors.black,
  iconTheme: IconThemeData(color: Colors.blueGrey[200]),
  brightness: Brightness.dark,
);
