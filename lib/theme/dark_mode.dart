import 'package:al_quran/globals.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: backgroundDark,
  ),
  scaffoldBackgroundColor: backgroundDark,
  colorScheme: ColorScheme.dark(
    // background: Color(0xFF1D2233),
    background: backgroundDark,
  ),
);
