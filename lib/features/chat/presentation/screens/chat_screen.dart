import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/features/chat/presentation/provider/show_scroll_button.dart';
import 'package:chat_box/features/chat/presentation/widgets/chat_app_bar.dart';
import 'package:chat_box/features/chat/presentation/widgets/chat_input.dart';
import 'package:chat_box/features/chat/presentation/widgets/loading_chat.dart';
import 'package:chat_box/features/chat/presentation/widgets/message_bubble.dart';
import 'package:chat_box/features/messages/data/models/chatted_users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../core/inherited_widgets/inherited_user.dart';
import '../../data/models/message.dart';
import '../bloc/socket_bloc.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  final String? path;
  ChatScreen({super.key, this.path, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  bool flag = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    context.read<SocketBloc>().add(LoadInitialMessage(widget.user.id!));
  }

  double lastOffset = 0;
  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      context.read<SocketBloc>().add(LoadMoreMessages(widget.user.id!));
    }
    final provider = Provider.of<ShowScrollButton>(context, listen: false);
    double currentOffset = _scrollController.offset;
    if (currentOffset > lastOffset && currentOffset > 50 && !flag) {
      provider.showScrollButton();
    } else if (currentOffset < 50) {
      provider.hideScrollButton();
    }
  }

  bool hasReachedMax = false;
  List<Message> messages = [];
  @override
  Widget build(BuildContext context) {

    return MyInheritedWidget(
      user: widget.user,
      child: Scaffold(
        appBar: chatAppBar(context, widget.user),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Column(
            children: [
              BlocBuilder<SocketBloc, SocketState>(
                builder: (context, state) {
                  if (state is LoadingMessages) {
                    return Expanded(child: LoadingChat());
                  }
                  if (state is MessagesLoaded) {
                    hasReachedMax = state.hasReachedMax;
                    messages.clear();
                    messages.addAll(state.messages);
                    // if (widget.msg != null) {
                    //   context.read<SocketBloc>().add(
                    //     SendMessageWithFile(widget.msg!, widget.path!),
                    //   );
                    //   widget.msg = null;
                    // }

                  }
                  return Expanded(
                    child: ListView.separated(
                      reverse: true,
                      controller: _scrollController,
                      cacheExtent: 2000,
                      separatorBuilder:
                          (context, index) => SizedBox(height: 10),
                      itemCount:
                          hasReachedMax
                              ? messages.length
                              : messages.length + 1,
                      itemBuilder: (context, index) {
                        if (flag) {
                          scrollToEnd();
                        }
                        if (index >= messages.length && !hasReachedMax) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(
                                color: ColorsManager.cyan,
                              ),
                            ),
                          );
                        }
                        return MessageBubble(
                          key: ValueKey(messages[index].id),
                          message:messages[index],
                          id:widget.user.id!
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 10),
              ChatInput(
                ),

            ],
          ),
        ),
        floatingActionButton: Consumer<ShowScrollButton>(
          builder: (context, provider, child) {
            return provider.isVisible
                ? Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: FloatingActionButton(
                    backgroundColor: ColorsManager.darkBlue,
                    onPressed: () {
                      if (_scrollController.hasClients) {
                        _scrollController.jumpTo(
                          _scrollController.position.minScrollExtent,
                        );
                      }
                    },
                    child: Icon(
                      Icons.arrow_downward_sharp,
                      color: ColorsManager.medGrey,
                    ),
                  ),
                )
                : SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void scrollToEnd() {
    Future.delayed(const Duration(milliseconds: 0), () {
      if (_scrollController.hasClients && flag) {
        _scrollController.jumpTo(_scrollController.position.minScrollExtent);
        flag = false;
      }
    });
  }
}
//169
