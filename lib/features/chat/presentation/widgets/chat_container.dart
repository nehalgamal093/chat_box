import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class ChatContainer extends StatelessWidget {
  final bool isSender;
  final String message;
  const ChatContainer({super.key,required this.isSender,required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender?Alignment.topRight:Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSender? ColorsManager.cyan:ColorsManager.chatColor,
          borderRadius: BorderRadius.only(
            topRight:isSender? Radius.circular(0):Radius.circular(15),
            topLeft:isSender? Radius.circular(15):Radius.circular(0),
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        child: Text(
          message,
          style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
