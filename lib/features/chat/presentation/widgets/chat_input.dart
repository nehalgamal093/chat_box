import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/core/resources/images/images_manager.dart';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  static const String routeName = StringsManager.chatScreenRoute;
  const ChatInput({super.key});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final FocusNode _textFieldFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        ImageIcon(
          AssetImage(ImagesManager.clip),
          color: ColorsManager.whiteColor,
        ),
        SizedBox(width: 10),
        SizedBox(
          width:   _textFieldFocusNode.hasFocus?size.width * .7: size.width * .65,
          height: 50,
          child: TextField(
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
        _textFieldFocusNode.hasFocus? Row(
          children: [
            SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: Colors.cyan,
              child: Image.asset(ImagesManager.send),
            ),
          ],
        ):
     Row(
       children: [
         SizedBox(width: 5),
         Image.asset(ImagesManager.camera),
         SizedBox(width: 10),
         Image.asset(ImagesManager.mic),
       ],
     )
      ],
    );
  }
}
