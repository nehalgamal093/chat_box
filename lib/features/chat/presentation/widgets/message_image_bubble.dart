import 'package:chat_box/features/chat/data/models/message.dart';
import 'package:flutter/material.dart';

class MessageImageBubble extends StatelessWidget {
  final Message message;
  const MessageImageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          message.message!,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width * .5,
          height: MediaQuery.of(context).size.height * .3,
          child: Image.network(message.mediaUrl!, fit: BoxFit.cover),
        ),
      ],
    );
  }
}
