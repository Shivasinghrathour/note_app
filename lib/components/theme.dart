import 'package:flutter/material.dart';
import 'package:note_app/components/color.dart';

var darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    background: bgColor,
    primary: textColor,
    onPrimaryContainer: containerColor,
    onSecondary: label,
  ),
  // large font heading text
  textTheme: const TextTheme(
    // for title
    titleLarge: TextStyle(
        fontFamily: "Myfont",
        fontSize: 45,
        fontWeight: FontWeight.w600,
        wordSpacing: 2),
    displayLarge: TextStyle(
      fontFamily: "Myfont",
      fontSize: 43,
      fontWeight: FontWeight.w600,
    ),
    // medium fonts like note text
    displayMedium: TextStyle(
      fontFamily: "Myfont",
      fontSize: 25,
      fontWeight: FontWeight.w400,
    ),
    //othere text like search and label text
    displaySmall: TextStyle(
      fontFamily: "Myfont",
      fontSize: 20,
      fontWeight: FontWeight.w300,
    ),
    // for title label
    labelLarge: TextStyle(
        fontFamily: "Myfont",
        fontSize: 43,
        fontWeight: FontWeight.w600,
        color: label),
    // for description label
    labelSmall: TextStyle(
        fontFamily: "Myfont",
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: label),
    // for search label
    labelMedium: TextStyle(
        fontFamily: "Myfont",
        fontSize: 20,
        fontWeight: FontWeight.w300,
        color: label),
    // for search text
    bodySmall: TextStyle(
        fontFamily: "Myfont",
        fontSize: 20,
        fontWeight: FontWeight.w300,
        color: textColor),
  ),
);
