import 'package:flutter/material.dart';

const GREEN1 = Colors.green;
const GREEN2 = Color.fromARGB(255, 126, 202, 156);
const GREEN3 = Color.fromARGB(255, 204, 255, 189);
const BLACK1 = Color.fromARGB(255, 64, 57, 74);
const BLACK2 = Color.fromARGB(255, 28, 20, 39);

ThemeData light = ThemeData(
  brightness: Brightness.light,
  primaryColor: GREEN1,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: GREEN1,
    elevation: 4,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: GREEN1,
    ),
    bodyText2: TextStyle(
      color: GREEN1,
    ),
  ),
  tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: GREEN1,
        ),
      ),
    ),
    labelColor: GREEN1,
    unselectedLabelColor: BLACK1,
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
  listTileTheme: ListTileThemeData(
    textColor: GREEN1,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: GREEN1,
  ),
);

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: GREEN1,
  scaffoldBackgroundColor: BLACK2,
  appBarTheme: AppBarTheme(
    backgroundColor: BLACK2,
    elevation: 0,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: GREEN1,
    ),
    bodyText2: TextStyle(
      color: GREEN1,
    ),
  ),
  tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: GREEN1,
        ),
      ),
    ),
    labelColor: GREEN1,
    unselectedLabelColor: Colors.white,
  ),
  listTileTheme: ListTileThemeData(
    textColor: GREEN1,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
  ),
);
