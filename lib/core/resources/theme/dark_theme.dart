import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/core/resources/fonts/custom_fonts.dart';
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
      headlineLarge: CustomFonts.large10(),
      headlineMedium: CustomFonts.large9(),
      bodyLarge:CustomFonts.medium10(),
      bodyMedium:CustomFonts.medium7(),
      bodySmall: CustomFonts.small10(),
      titleLarge:CustomFonts.medium9(),
      titleSmall: CustomFonts.small9(),

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.primaryColor,
      unselectedItemColor: ColorsManager.medGrey,
      selectedItemColor: ColorsManager.whiteColor,
      elevation: 0,
      type: BottomNavigationBarType.fixed
    ),
  );
}
