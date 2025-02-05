import 'package:flutter/material.dart';

import '../app_color.dart';
import '../light/color_scheme/color_scheme_light.dart';
import 'text/text_theme_light.dart';

final class AppThemeLight {
  static final TextThemeLight _textTheme = TextThemeLight();
  static final ColorSchemeLight _colorScheme = ColorSchemeLight();

  final ThemeData getTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: _textTheme.getTheme,
    primaryTextTheme: _textTheme.getTheme.apply(
      displayColor: AppColor.onPrimary,
      bodyColor: AppColor.onPrimary,
    ),
    // Color Scheme
    colorScheme: _colorScheme.getTheme,

    // Typography
    fontFamily: 'Roboto',
    typography: Typography.material2021(),

    // Component Themes
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.primary,
      foregroundColor: AppColor.onPrimary,
      elevation: 4,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    primaryIconTheme: const IconThemeData(color: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColor.primary,
        side: const BorderSide(color: AppColor.primary),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColor.primary,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primary,
      foregroundColor: AppColor.onPrimary,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColor.surface,
      selectedItemColor: AppColor.primary,
      unselectedItemColor: Colors.grey,
    ),
    cardTheme: const CardTheme(
      color: AppColor.surface,
      elevation: 2,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColor.outline,
      thickness: 1,
    ),
    switchTheme: SwitchThemeData(),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(),
    ),
    scrollbarTheme: const ScrollbarThemeData(),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColor.surface,
      contentTextStyle: TextStyle(color: AppColor.onSurface),
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColor.primary,
    ),

    primaryColor: AppColor.primary,
  );
}
