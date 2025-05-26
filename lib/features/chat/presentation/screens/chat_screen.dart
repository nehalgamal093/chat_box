import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:chat_box/features/chat/presentation/widgets/chat_app_bar.dart';
import 'package:chat_box/features/chat/presentation/widgets/chat_container.dart';
import 'package:chat_box/features/chat/presentation/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = StringsManager.chatScreenRoute;

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: chatAppBar(context),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height * .92,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      if (index % 2 == 0) {
                        return ChatContainer(isSender: true);
                      } else {
                        return ChatContainer(isSender: false);
                      }
                    },
                  ),
                ),
                SizedBox(height: 10),
                ChatInput(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
