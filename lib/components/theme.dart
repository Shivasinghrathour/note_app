import 'package:flutter/material.dart';
import 'package:note_app/components/color.dart';

var darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    background: bgColor,
    primary: textColor,
    onPrimaryContainer: ContainerColor,
  ),
  // large font heading text
  textTheme: TextTheme(
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
  ),
);
