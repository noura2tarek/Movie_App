import 'package:flutter/material.dart';
import '../app_color/app_color_dark.dart';

ThemeData darkTheme() => ThemeData(
  primaryColor: AppColorsDark.primaryColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColorsDark.appBarColor,
  ),

);