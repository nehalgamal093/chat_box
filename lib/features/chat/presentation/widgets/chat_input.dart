import 'package:chat_box/core/caching/cache_helper.dart';
import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/core/resources/images/images_manager.dart';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:chat_box/features/chat/data/models/message.dart';
import 'package:chat_box/features/chat/presentation/provider/file_picker_provider.dart';
import 'package:chat_box/features/chat/presentation/widgets/file_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../bloc/socket_bloc.dart';

class ChatInput extends StatefulWidget {
  final String id;

  static const String routeName = StringsManager.chatScreenRoute;
  const ChatInput({super.key, required this.id});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final FocusNode _textFieldFocusNode = FocusNode();
  final TextEditingController messageEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FilePickerProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        FileBox(),
        Row(
          children: [
            InkWell(
              onTap: () {
                provider.pickFile();
              },
              child: ImageIcon(
                AssetImage(ImagesManager.clip),
                color: ColorsManager.whiteColor,
              ),
            ),
            SizedBox(width: 10),
            SizedBox(
              width:
                  _textFieldFocusNode.hasFocus
                      ? size.width * .7
                      : size.width * .65,
              height: 50,
              child: TextField(
                controller: messageEditingController,
                focusNode: _textFieldFocusNode,
                decoration: InputDecoration(
                  hintText: StringsManager.writeMessage,
                  hintStyle: Theme.of(
                    context,
                  ).textTheme.bodySmall!.copyWith(color: ColorsManager.medGrey),
                  fillColor: ColorsManager.chatInputColor,
                  contentPadding: EdgeInsets.only(bottom: 10, left: 10),
                  filled: true,

                  suffixIcon: Image.asset(ImagesManager.files, width: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 2.0,
                      color: ColorsManager.chatInputColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 2.0,
                      color: ColorsManager.chatInputColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 2.0,
                      color: ColorsManager.chatInputColor,
                    ),
                  ),
                ),
              ),
            ),
            _textFieldFocusNode.hasFocus
                ? InkWell(
                  onTap: () {
                    if (messageEditingController.text.isNotEmpty) {
                      Message message = Message(
                        receiverId: widget.id,
                        senderId: CacheHelper.getUserId(),
                        message: messageEditingController.text,
                        createdAt: DateTime.now().toString()
                      );
                      if (provider.file.path.isNotEmpty) {
                        context.read<SocketBloc>().add(
                          SendMessageWithFile(message, provider.file.path),
                        );
                      } else {
                        context.read<SocketBloc>().add(SendMessage(message));
                      }
                    }
                    clear();
                    provider.clear();
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundColor: Colors.cyan,
                        child: Image.asset(ImagesManager.send),
                      ),
                    ],
                  ),
                )
                : Row(
                  children: [
                    SizedBox(width: 5),
                    Image.asset(ImagesManager.camera),
                    SizedBox(width: 10),
                    Image.asset(ImagesManager.mic),
                  ],
                ),
          ],
        ),
      ],
    );
  }

  void clear() {
    messageEditingController.clear();
  }
}
