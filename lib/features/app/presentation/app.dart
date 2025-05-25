import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:chat_box/core/resources/theme/base_theme.dart';
import 'package:chat_box/core/resources/theme/dark_theme.dart';
import 'package:chat_box/features/main_screen/presentation/screens/main_screen.dart';
import 'package:chat_box/features/starting_screen/presentation/screens/starting_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    BaseTheme darkTheme = DarkTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringsManager.appName,
      theme: darkTheme.myThemeData,
      initialRoute: StartingScreen.routeName,
      routes: {
        MainScreen.routeName: (context) => MainScreen(),
        StartingScreen.routeName: (context) => StartingScreen(),
      },
    );
  }
}
