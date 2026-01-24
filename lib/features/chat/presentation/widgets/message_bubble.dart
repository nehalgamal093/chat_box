import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/features/chat/presentation/widgets/message_image_bubble.dart';
import 'package:chat_box/features/chat/presentation/widgets/message_text_bubble.dart';
import 'package:chat_box/features/chat/presentation/widgets/message_video_bubble.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/strings/strings_manager.dart';
import '../../data/models/message.dart';

class MessageBubble extends StatefulWidget {
  final Message message;
  final String id;
  const MessageBubble({super.key, required this.message, required this.id});

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble>
   {

  @override
  Widget build(BuildContext context) {
    bool isSender = widget.id != widget.message.senderId;
    return Align(
      alignment: isSender ? Alignment.topRight : Alignment.topLeft,

        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSender ? ColorsManager.senderColor : ColorsManager.receiverColor,
            borderRadius: BorderRadius.only(
              topRight: isSender ? Radius.circular(0) : Radius.circular(15),
              topLeft: isSender ? Radius.circular(15) : Radius.circular(0),
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              chatMediaBubble(widget.message.mediaType??"", widget.message),
              SizedBox(height: 5),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.message.createdAt!.substring(11, 16),
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 10,
                          color: isSender
                              ? ColorsManager.whiteColor
                              : ColorsManager.grey,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),

    );
  }
}

Widget chatMediaBubble(String mediaType, Message message) {
  switch (mediaType) {
    case StringsManager.image:
      return MessageImageBubble(message: message);

    case StringsManager.video:
      return MessageVideoBubble(message: message,);

    default:
      return MessageTextBubble(message: message.message!);
  }
}

