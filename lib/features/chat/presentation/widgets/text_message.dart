import 'package:chat_box/core/extensions/capitalize.dart';
import 'package:flutter/material.dart';

class TextMessage extends StatelessWidget {
  final String message;
  const TextMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Text(
      message.isEmpty ? message : message.capitalize(),
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
