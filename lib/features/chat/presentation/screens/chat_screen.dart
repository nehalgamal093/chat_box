import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:chat_box/features/chat/presentation/widgets/chat_app_bar.dart';
import 'package:chat_box/features/chat/presentation/widgets/chat_input.dart';
import 'package:chat_box/features/chat/presentation/widgets/message_image_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../data/models/message.dart';
import '../bloc/socket_bloc.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = StringsManager.chatScreenRoute;
  final String userId;
  final String fullName;
  final String image;
  final String gender;
   Message? msg;
  final String? path;
   ChatScreen({
    super.key,
    required this.userId,
    required this.fullName,
    required this.image,
    this.path,
    required this.gender,
    this.msg,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatAppBar(
        context,
        widget.fullName,
        widget.image,
        widget.userId,
        widget.gender,
      ),
      body: BlocProvider(
        create:
            (context) =>
                getIt<SocketBloc>()
                  ..add(SocketConnect())
                  ..add(LoadMessages(widget.userId)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Column(
            children: [
              BlocBuilder<SocketBloc, SocketState>(
                builder: (context, state) {
                  if (state is MessagesLoaded) {
                    if (widget.msg != null) {
                      context.read<SocketBloc>().add(
                        SendMessageWithFile(widget.msg!, widget.path!),
                      );
                      widget.msg = null;
                    }
                    scrollToEnd();
                    return Expanded(
                      child: ListView.separated(
                        controller: _scrollController,
                        cacheExtent: 2000,
                        separatorBuilder:
                            (context, index) => SizedBox(height: 10),
                        itemCount:
                            state.messages.length <= 15
                                ? state.messages.length
                                : 15,
                        itemBuilder: (context, index) {
                          List<Message> messages = [];
                          if (state.messages.length <= 15) {
                            messages = state.messages;
                          } else {
                            int size = state.messages.length - 15;
                            messages = state.messages.sublist(size);
                          }
                          return MessageImageBubble(
                            isSender:
                                messages[index].senderId! != widget.userId,
                            message: messages[index].message!,
                            image:
                                messages[index].mediaUrl == null
                                    ? ""
                                    : messages[index].mediaUrl!,
                            time: messages[index].createdAt!,
                          );
                        },
                      ),
                    );
                  } else if (state is LoadingMessages) {
                    return Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return Text('Error');
                  }
                },
              ),
              SizedBox(height: 10),
              ChatInput(
                id: widget.userId,
                image: widget.image,
                fullName: widget.fullName,
                gender: widget.gender,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void scrollToEnd() {
    Future.delayed(const Duration(milliseconds: 0), () {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }
}
