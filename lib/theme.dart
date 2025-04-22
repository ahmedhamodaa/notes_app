import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

ThemeData themeData() {
  return ThemeData(
    scaffoldBackgroundColor: kColorPrimary,
    brightness: Brightness.dark,
    fontFamily: 'Nunito',
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(Size(50, 50)),
        backgroundColor: WidgetStateProperty.all(kColorSecondary),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: kColorOnPrimary,
      backgroundColor: kColorSecondary,
      iconSize: 28,
    ),
    colorScheme: ColorScheme.dark(
      primary: kColorPrimary,
      onPrimary: kColorOnPrimary,
      secondary: kColorSecondary,
    ),
  );
}
