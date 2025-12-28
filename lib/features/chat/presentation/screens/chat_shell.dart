import 'package:chat_box/features/chat/presentation/screens/chat_screen.dart';
import 'package:chat_box/features/messages/data/models/chatted_users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../bloc/socket_bloc.dart';

class ChatShell extends StatelessWidget {
  final User user;
  const ChatShell({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<SocketBloc>()
          ..add(SocketConnect())
          ..add(
            LoadInitialMessage(
              user.id!,
            ),
          ),
        child: Navigator(
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              builder: (_) => ChatScreen(user: user),
            );
          },
        ),
      ),
    );
  }
}
