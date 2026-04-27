import 'package:chat_box/core/resources/fonts/custom_fonts.dart';
import 'package:flutter/material.dart';
import 'package:chat_box/features/user_profile/data/models/user_profile.dart';
import '../../../../core/resources/images/images_manager.dart';

class FriendWidget extends StatelessWidget {
  final Friends friend;
  const FriendWidget({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
        width: size.width * .3,
        height: size.height * .3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: getPicture(friend.profilePicture!), fit: BoxFit.cover)),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              friend.fullName!,
              style: CustomFonts.med02(),
            ),
          ),
        ));
  }

  getPicture(String profilePicture) {
    if (profilePicture.isEmpty) {
      return AssetImage(ImagesManager.avatar);
    } else {
      return NetworkImage(profilePicture);
    }
  }
}
