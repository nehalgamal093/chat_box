import 'package:chat_box/core/caching/cache_helper.dart';
import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/core/resources/images/images_manager.dart';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:chat_box/features/chat/data/models/message.dart';
import 'package:chat_box/features/chat/presentation/screens/chat_screen.dart';
import 'package:chat_box/features/chat/presentation/widgets/file_box.dart';
import 'package:flutter/material.dart';

import '../../messages/data/models/chatted_users.dart';

class ViewPhotoInput extends StatefulWidget {
  final User user;
  final String path;

  static const String routeName = StringsManager.chatScreenRoute;
  const ViewPhotoInput({super.key, required this.path, required this.user});

  @override
  State<ViewPhotoInput> createState() => _ViewPhotoInputState();
}

class _ViewPhotoInputState extends State<ViewPhotoInput> {
  final TextEditingController messageEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        FileBox(),
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
            InkWell(
              onTap: () {
                Message message = Message(
                  receiverId: widget.user.id,
                  senderId: CacheHelper.getUserId(),
                  message: messageEditingController.text,
                  createdAt: DateTime.now().toString(),
                );
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ChatScreen(
                          user: widget.user,
                          path: widget.path,
                          msg: message,
                        ),
                  ),
                );
                clear();
              },
              child: Row(
                children: [
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: ColorsManager.cyan,
                    child: Image.asset(ImagesManager.send),
                  ),
                ],
              ),
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
