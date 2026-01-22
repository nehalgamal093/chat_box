import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../core/resources/colors/colors_manager.dart';
import '../../data/models/message.dart';
import '../bloc/socket_bloc.dart';
import '../provider/show_scroll_button.dart';
import 'loading_chat.dart';
import 'message_bubble.dart';

class MessagesList extends StatefulWidget {
  final String userId;
  final ScrollController scrollController;
  const MessagesList({super.key,required this.userId,required this.scrollController});

  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {


  bool flag = true;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
    context.read<SocketBloc>().add(LoadInitialMessage(widget.userId));
  }

  double lastOffset = 0;
  void _scrollListener() {
    loadMore();
    showHideScrollButton();
  }

  void loadMore() {
    if (widget.scrollController.offset >=
        widget.scrollController.position.maxScrollExtent &&
        !widget.scrollController.position.outOfRange) {
      context.read<SocketBloc>().add(LoadMoreMessages(widget.userId));
    }
  }

  void showHideScrollButton() {
    final provider = Provider.of<ShowScrollButton>(context, listen: false);
    double currentOffset = widget.scrollController.offset;
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
    return BlocBuilder<SocketBloc, SocketState>(
      builder: (context, state) {
        if (state is LoadingMessages) {
          return Expanded(child: LoadingChat());
        }
        if (state is MessagesLoaded) {
          hasReachedMax = state.hasReachedMax;
          messages.clear();
          messages.addAll(state.messages);
        }
        return Expanded(
          child: ListView.separated(
            reverse: true,
            controller: widget.scrollController,
            cacheExtent: 2000,
            separatorBuilder: (context, index) =>
                SizedBox(height: 10),
            itemCount:
            hasReachedMax ? messages.length : messages.length + 1,
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
                  message: messages[index],
                  id: widget.userId);
            },
          ),
        );
      },
    );
  }

  void scrollToEnd() {
    Future.delayed(const Duration(milliseconds: 0), () {
      if (widget.scrollController.hasClients && flag) {
        widget.scrollController.jumpTo(widget.scrollController.position.minScrollExtent);
       flag = false;
      }
    });
  }
}
