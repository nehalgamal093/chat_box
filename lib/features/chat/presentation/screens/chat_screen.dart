import 'package:chat_box/features/chat/presentation/bloc/socket_bloc.dart';
import 'package:chat_box/features/chat/presentation/widgets/chat_app_bar.dart';
import 'package:chat_box/features/chat/presentation/widgets/chat_input.dart';
import 'package:chat_box/features/chat/presentation/widgets/load_more_button.dart';
import 'package:chat_box/features/chat/presentation/widgets/messages_list.dart';
import 'package:flutter/material.dart';
import '../../../../core/di/di.dart';
import '../../../../core/inherited_widgets/inherited_user.dart';

class ChatScreen extends StatefulWidget {
  final String userId;
  final String? path;
  const ChatScreen({super.key, this.path, required this.userId});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      userId: widget.userId,
      child: Scaffold(
        // appBar: chatAppBar(context, widget.userId),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Column(
            children: [
              MessagesList(
                userId: widget.userId,
                scrollController: _scrollController,
              ),
              SizedBox(height: 10),
              ChatInput(),
            ],
          ),
        ),
        floatingActionButton:
            LoadMoreButton(scrollController: _scrollController),
      ),
    );
  }
  @override
  void dispose() {
     SocketBloc socket = getIt<SocketBloc>();
  socket.add(ChatClosedEvent());
    super.dispose();
  }
}