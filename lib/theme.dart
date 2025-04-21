import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Nunito',
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(Size(50, 50)),
        backgroundColor: WidgetStateProperty.all(Color(0xff3B3B3B)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    ),
  );
}
