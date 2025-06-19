import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:chat_box/core/resources/theme/base_theme.dart';
import 'package:chat_box/core/resources/theme/dark_theme.dart';
import 'package:flutter/material.dart';
import '../../../core/caching/cache_helper.dart';
import '../../auth/presentation/screens/login/presentation/screens/login_screen.dart';
import '../../auth/presentation/screens/register/presentation/screens/register_screen.dart';
import '../../chat/presentation/screens/chat_screen.dart';
import '../../main/presentation/screens/main_screen.dart';
import '../../starting/presentation/screens/starting_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    BaseTheme darkTheme = DarkTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringsManager.appName,
      theme: darkTheme.myThemeData,
      initialRoute:
          CacheHelper.getToken() == null
              ? StartingScreen.routeName
              : MainScreen.routeName,
      routes: {
        MainScreen.routeName: (context) => MainScreen(),
        StartingScreen.routeName: (context) => StartingScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        ChatScreen.routeName: (context) => ChatScreen(userId: '',fullName: '',image: '',gender:''),
      },
    );
  }
}
