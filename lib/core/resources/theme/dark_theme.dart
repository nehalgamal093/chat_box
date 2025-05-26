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
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: background,
      iconTheme: IconThemeData(color: textColor),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 68,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ColorsManager.grey,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: ColorsManager.grey,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.darkBlack,
      unselectedItemColor: ColorsManager.medGrey,
      selectedItemColor: ColorsManager.whiteColor,
      elevation: 0,
      type: BottomNavigationBarType.fixed
    ),
  );
}
