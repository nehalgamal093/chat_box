import 'package:chat_box/features/chat/presentation/screens/chat_screen.dart';
import 'package:chat_box/features/main/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../bloc/socket_bloc.dart';

class ChatShell extends StatefulWidget {
  final bool fromNotification;
  final String userId;
  const ChatShell(
      {super.key, required this.userId, this.fromNotification = false});

  @override
  State<ChatShell> createState() => _ChatShellState();
}

class _ChatShellState extends State<ChatShell> {
  final GlobalKey<NavigatorState> _nestedNavigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        final nestedNavigatorState = _nestedNavigatorKey.currentState;

        if (nestedNavigatorState != null && nestedNavigatorState.canPop()) {
          nestedNavigatorState.pop();
        } else {
          _goBackToHome(context);
        }
        return false;
      },
      child: Scaffold(
        body: BlocProvider(
          create: (context) => getIt<SocketBloc>()
             ..add(SocketConnect())
            ..add(
              LoadInitialMessage(
                widget.userId,
              )
            )
          ,
          child: Navigator(
            key: _nestedNavigatorKey,
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (_) => ChatScreen(userId: widget.userId),
              );
            },
          ),
        ),
      ),
    );
  }

  void _goBackToHome(BuildContext context) {
    if (widget.fromNotification) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => MainScreen()), (route) => false);
    } else {
      Navigator.of(context).pop();
    }
  }
}
