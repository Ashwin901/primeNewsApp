import 'package:flutter/material.dart';
import 'package:prime_news/components/constants.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
        color: Colors.grey
    ),
  accentColor: Colors.black,
  textTheme: TextTheme(
    bodyText2: screenStyle.copyWith(
      fontFamily: "Robot",
      fontWeight: FontWeight.bold,
      color: Colors.white
    )
  )
);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    color: Colors.white
  ),
  textTheme: TextTheme(
    bodyText2:screenStyle.copyWith(
      fontFamily: "Robot",
      fontWeight: FontWeight.bold,
      color: Colors.black
    )
  )
);