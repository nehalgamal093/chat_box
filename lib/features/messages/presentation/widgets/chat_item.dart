import 'package:chat_box/core/common_widgets/circle_picture.dart';
import 'package:chat_box/features/chat/presentation/screens/chat_shell.dart';
import 'package:chat_box/features/chat/presentation/widgets/text_message.dart';
import 'package:flutter/material.dart';
import '../../data/models/chatted_users.dart';

class ChatItem extends StatelessWidget {
  final String lastMessage;
  final String time;
  final User user;
  const ChatItem({super.key, required this.lastMessage, required this.time,required this.user});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ChatShell(userId: user.id!),
          ),
        );

      },
      child: ListTile(
        leading: Badge(
          backgroundColor: Colors.green,
          smallSize:user.isOnline ==true? 15:0,
          child: InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder:
              //         (context) => UserProfileScreen(
              //           id: MyInheritedWidget.of(context).user.id!,
              //         ),
              //   ),
              // );
            },
            child: CirclePicture(
                imageUrl:user.profilePicture!,
                radius: 40,userId: user.id!,),
          ),
        ),
        title: Text(
         user.fullName!,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle: TextMessage(message: lastMessage),
        trailing: Column(
          children: [
            Text(
              time.substring(15, 19),
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
