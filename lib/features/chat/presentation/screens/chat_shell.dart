import 'package:chat_box/features/chat/presentation/screens/chat_screen.dart';
import 'package:chat_box/features/main/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../bloc/socket_bloc.dart';

class ChatShell extends StatelessWidget {
  final bool fromNotification;
  final String userId;
  const ChatShell(
      {super.key, required this.userId, this.fromNotification = false});

  @override
  Widget build(BuildContext context) {
    print('Hey 🧨🧨🧨 $userId');
    return WillPopScope(
      onWillPop: () async {
        _goBackToHome(context);
        return false;
      },
      child: Scaffold(
        body: BlocProvider(
          create: (context) => getIt<SocketBloc>()
             ..add(SocketConnect())
            ..add(
              LoadInitialMessage(
                userId,
              )
            )
          ,
          child: Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (_) => ChatScreen(userId: userId),
              );
            },
          ),
        ),
      ),
    );
  }

  void _goBackToHome(BuildContext context) {
    if (fromNotification) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => MainScreen()), (route) => false);
    } else {
      Navigator.of(context).pop();
    }
  }
}
