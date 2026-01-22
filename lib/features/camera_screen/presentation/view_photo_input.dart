import 'package:chat_box/core/caching/cache_helper.dart';
import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/core/resources/images/images_manager.dart';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:chat_box/features/chat/data/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../chat/presentation/bloc/socket_bloc.dart';

class ViewPhotoInput extends StatefulWidget {
  final String userId;
  final String path;
  const ViewPhotoInput({super.key, required this.path, required this.userId});

  @override
  State<ViewPhotoInput> createState() => _ViewPhotoInputState();
}

class _ViewPhotoInputState extends State<ViewPhotoInput> {
  final TextEditingController messageEditingController =
      TextEditingController();
  InputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      width: 2.0,
      color: ColorsManager.chatInputColor,
    ),
  );
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            SizedBox(
              width: size.width * .75,
              height: 50,
              child: TextField(
                controller: messageEditingController,
                decoration: InputDecoration(
                  hintText: StringsManager.writeMessage,
                  hintStyle: Theme.of(
                    context,
                  ).textTheme.bodySmall!.copyWith(color: ColorsManager.medGrey),
                  fillColor: ColorsManager.chatInputColor,
                  contentPadding: EdgeInsets.only(bottom: 10, left: 10),
                  filled: true,
                  border: border,
                  enabledBorder: border,
                  focusedBorder:border,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Message message = Message(
                  receiverId: widget.userId,
                  senderId: CacheHelper.getUserId(),
                  message: messageEditingController.text,
                  createdAt: DateTime.now().toString(),
                );

                Navigator.pop(context);
                context.read<SocketBloc>().add(
                    SendMessageWithFile(message, widget.path));
                clear();
              },
              child: Row(
                children: [
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: ColorsManager.senderColor,
                    child: Image.asset(ImagesManager.send),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10,)
      ],
    );
  }

  void clear() {
    messageEditingController.clear();
  }
}