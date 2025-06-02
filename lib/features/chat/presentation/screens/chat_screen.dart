import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:chat_box/features/chat/presentation/widgets/chat_app_bar.dart';
import 'package:chat_box/features/chat/presentation/widgets/chat_input.dart';
import 'package:chat_box/features/chat/presentation/widgets/message_image_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../bloc/socket_bloc.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = StringsManager.chatScreenRoute;
  final String userId;
  final String fullName;
  final String image;
  const ChatScreen({
    super.key,
    required this.userId,
    required this.fullName,
    required this.image,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: chatAppBar(context, widget.fullName, widget.image),
      body: SingleChildScrollView(
        child: BlocProvider(
          create:
              (context) =>
                  getIt<SocketBloc>()
                    ..add(SocketConnect())
                    ..add(LoadMessages(widget.userId)),
          child: SizedBox(
            height: size.height * .92,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  BlocBuilder<SocketBloc, SocketState>(
                    builder: (context, state) {
                      if (state is MessagesLoaded) {
                        scrollToEnd();
                        return Expanded(
                          child: ListView.separated(
                            controller: _scrollController,
                            separatorBuilder:
                                (context, index) => SizedBox(height: 10),
                            itemCount: state.messages.length,
                            itemBuilder: (context, index) {
                              return MessageImageBubble(
                                isSender:
                                    state.messages[index].senderId! !=
                                    widget.userId,
                                message: state.messages[index].message!,
                                image:
                                    state.messages[index].mediaUrl == null
                                        ? ""
                                        : state.messages[index].mediaUrl!,
                                time: state.messages[index].createdAt!,
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
                  ChatInput(id: widget.userId),
                ],
              ),
            ),
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
