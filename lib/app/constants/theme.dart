import 'package:flutter/material.dart';

const GREEN1 = Colors.green;
const GREEN2 = Color.fromARGB(255, 126, 202, 156);
const GREEN3 = Color.fromARGB(255, 204, 255, 189);
const BLACK1 = Color.fromARGB(255, 64, 57, 74);
const BLACK2 = Color.fromARGB(255, 28, 20, 39);

ThemeData light = ThemeData(
  primaryColor: GREEN1,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: GREEN1,
  ),
);

ThemeData dark = ThemeData(
  primaryColor: GREEN1,
  scaffoldBackgroundColor: BLACK2,
  appBarTheme: AppBarTheme(
    backgroundColor: GREEN2,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      color: Colors.white,
    ),
  ),
);
