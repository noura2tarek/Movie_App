import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_color/app_color_light.dart';
import 'package:movie_app/core/themes/app_size/app_size.dart';

ThemeData lightTheme() => ThemeData(
      primaryColor: AppColorsLight.primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColorsLight.appBarColor,
        iconTheme: IconThemeData(
          size: AppSizes.appbarIconSize,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.amber),
          backgroundColor: MaterialStateProperty.all(Colors.cyan),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColorsLight.floatingActionButtonColor,
      ),
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all(Colors.grey),
        thumbColor: MaterialStateProperty.all(Colors.blue),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: AppSizes.fontSize,
        ),
      ),
      iconTheme: const IconThemeData(
        size: 50.0,
      ),
    );
