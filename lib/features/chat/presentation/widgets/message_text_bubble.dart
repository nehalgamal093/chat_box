import 'package:flutter/material.dart';

class MessageTextBubble extends StatelessWidget {
  final String message;
  const MessageTextBubble({super.key,required this.message});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: Theme.of(
        context,
      ).textTheme.bodyMedium!.copyWith(fontSize: 16),
    );
  }
}
