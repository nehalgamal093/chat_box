import 'package:chat_box/core/caching/cache_helper.dart';
import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/core/resources/images/images_manager.dart';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:chat_box/features/chat/data/models/message.dart';
import 'package:chat_box/features/chat/presentation/provider/file_picker_provider.dart';
import 'package:chat_box/features/chat/presentation/widgets/file_box.dart';
import 'package:chat_box/features/chat/presentation/widgets/tools_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/inherited_widgets/inherited_user.dart';
import '../bloc/socket_bloc.dart';

class ChatInput extends StatefulWidget {
  static const String routeName = StringsManager.chatScreenRoute;
  const ChatInput({super.key});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final TextEditingController messageEditingController =
      TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool isInputEmpty = true;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FilePickerProvider>(context);
    Size size = MediaQuery.of(context).size;
    String userId = MyInheritedWidget.of(context).userId;
    return Column(
      children: [
        FileBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width * .80,
              height: 50,
              child: TextField(
                textInputAction: TextInputAction.next,
                focusNode: focusNode,
                onChanged: (val) {
                  if (messageEditingController.text.isNotEmpty) {
                    setState(() {
                      isInputEmpty = false;
                    });
                  } else {
                    setState(() {
                      isInputEmpty = true;
                    });
                  }
                },
                cursorColor: ColorsManager.whiteColor,
                controller: messageEditingController,
                decoration: InputDecoration(
                  hintText: StringsManager.writeMessage,
                  hintStyle: Theme.of(
                    context,
                  ).textTheme.bodySmall!.copyWith(color: ColorsManager.medGrey),
                  fillColor: ColorsManager.darkBlue,
                  contentPadding: EdgeInsets.only(bottom: 10, left: 10),
                  filled: true,
                  suffixIcon: InkWell(
                      onTap: () {
                        toolsBottomNav(context, userId, provider);
                      },
                      child: Image.asset(ImagesManager.files, width: 20)),
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Message message = Message(
                  receiverId: MyInheritedWidget.of(context).userId,
                  senderId: CacheHelper.getUserId(),
                  message: messageEditingController.text,
                  createdAt: DateTime.now().toString(),
                );
                if (provider.file.path.isNotEmpty) {
                  context.read<SocketBloc>().add(
                        SendMessageWithFile(message, provider.file.path),
                      );
                } else {
                  if (messageEditingController.text.isNotEmpty) {
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
                    backgroundColor: ColorsManager.cyan,
                    child: Image.asset(ImagesManager.send),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(width: 2.0, color: ColorsManager.chatInputColor),
  );
  void clear() {
    messageEditingController.clear();
  }
}
