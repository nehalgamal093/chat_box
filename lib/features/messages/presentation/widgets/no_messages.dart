import 'package:chat_box/core/resources/images/images_manager.dart';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:flutter/material.dart';

class NoMessages extends StatelessWidget {
  const NoMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImagesManager.inboxEmpty),
          Text(StringsManager.emptyInbox,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Color(
              0x71ffffff)),)
        ],
      ),
    );
  }
}
