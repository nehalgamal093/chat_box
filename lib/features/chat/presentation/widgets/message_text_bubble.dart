import 'package:chat_box/features/chat/presentation/widgets/text_message.dart';
import 'package:flutter/material.dart';

class MessageTextBubble extends StatelessWidget {
  final String message;
  const MessageTextBubble({super.key,required this.message});

  @override
  Widget build(BuildContext context) {
    return TextMessage(message: message);
  }
}
