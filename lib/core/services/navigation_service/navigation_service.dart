import 'package:chat_box/features/chat/presentation/screens/chat_shell.dart';
import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<void> openChatFromNotification(String userId) async {
    await Future.delayed(Duration(milliseconds: 500));

    navigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => ChatShell(userId: userId,fromNotification: true,)),
        (route) => false);
  }
}
