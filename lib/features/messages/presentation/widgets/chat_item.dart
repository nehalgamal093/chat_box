import 'package:chat_box/core/common_widgets/circle_picture.dart';
import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/core/resources/fonts/custom_fonts.dart';
import 'package:chat_box/features/chat/presentation/screens/chat_shell.dart';
import 'package:chat_box/features/chat/presentation/widgets/text_message.dart';
import 'package:flutter/material.dart';
import '../../../../core/inherited_widgets/inherited_user.dart';
import '../../../user_profile/presentation/screens/user_profile_screen.dart';
import '../../data/models/chatted_users.dart';

class ChatItem extends StatelessWidget {
  final String lastMessage;
  final String time;
  final User user;
  const ChatItem(
      {super.key,
      required this.lastMessage,
      required this.time,
      required this.user});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ChatShell(userId: user.id!),
            ),
          );
        },
        child: Container(
         margin: const EdgeInsets.symmetric(horizontal: 15),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: ColorsManager.grey00,
              borderRadius: BorderRadius.circular(22)),
          child: Row(
            children: [
              CirclePicture(
                imageUrl: user.profilePicture!,
                radius: 40,
                userId: user.id!,
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.fullName!,
                    style: CustomFonts.med00(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextMessage(message: lastMessage),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time.substring(15, 19),
                    style: CustomFonts.med01(fontColor: ColorsManager.purple00),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Badge(

                    backgroundColor: ColorsManager.purple00,
                    label: Text('1'),
                 ),
                ],
              )
            ],
          ),
        ));
  }
}
//
// Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder:
//         (context) => UserProfileScreen(
//           id: MyInheritedWidget.of(context).user.id!,
//         ),
//   ),
// );