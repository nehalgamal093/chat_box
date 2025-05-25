import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/core/resources/theme/base_theme.dart';
import 'package:flutter/material.dart';

class DarkTheme extends BaseTheme {
  @override
  Color get background => ColorsManager.primaryColor;

  @override
  Color get textColor => ColorsManager.whiteColor;

  @override
  ThemeData get myThemeData => ThemeData(
    scaffoldBackgroundColor: background,
    appBarTheme: AppBarTheme(centerTitle: true),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 68,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ColorsManager.grey,
      ),
    ),
  );
}
