import 'package:flutter/material.dart';
import 'package:chat_box/features/user_profile/data/models/user_profile.dart';
import '../../../../core/resources/images/images_manager.dart';

class FriendWidget extends StatelessWidget {
  final Friends friend;
  const FriendWidget({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: friend.profilePicture == null || friend.profilePicture!.isEmpty
              ? Image.asset(ImagesManager.avatar)
              : Image.network(friend.profilePicture!),
        ),
        SizedBox(height: 10),
        Text(
          friend.fullName!,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}
