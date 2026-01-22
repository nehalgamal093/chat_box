import 'package:chat_box/core/caching/cache_helper.dart';
import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/core/resources/images/images_manager.dart';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:chat_box/features/camera_screen/presentation/screens/camera_screen.dart';
import 'package:chat_box/features/chat/data/models/message.dart';
import 'package:chat_box/features/chat/presentation/provider/file_picker_provider.dart';
import 'package:chat_box/features/chat/presentation/widgets/file_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/inherited_widgets/inherited_user.dart';
import '../bloc/socket_bloc.dart';
import '../provider/chat_shell_provider.dart';

class ChatInput extends StatefulWidget {
  static const String routeName = StringsManager.chatScreenRoute;
  const ChatInput({super.key});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final FocusNode _textFieldFocusNode = FocusNode();
  final TextEditingController messageEditingController =
      TextEditingController();
  bool isInputEmpty = true;
  @override
  Widget build(BuildContext context) {
    var chatShellProvider = Provider.of<ChatShellProvider>(context);
    var provider = Provider.of<FilePickerProvider>(context);
    Size size = MediaQuery.of(context).size;
    String userId = MyInheritedWidget.of(context).userId;
    return Column(
      children: [
        FileBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            SizedBox(
              width: !isInputEmpty ? size.width * .7 : size.width * .65,
              height: 50,
              child: TextField(
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
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ),
            ),
            !isInputEmpty
                ? InkWell(
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
                        context.read<SocketBloc>().add(SendMessage(message));
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
                : Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          // chatShellProvider.changeIndex(1);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CameraScreen(
                                userId: userId,
                              ),
                            ),
                          );
                        },
                        child: Image.asset(ImagesManager.camera),
                      ),
                      SizedBox(width: 10),
                      Image.asset(ImagesManager.mic),
                    ],
                  ),
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
//162
