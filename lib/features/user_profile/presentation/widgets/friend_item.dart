import 'package:chat_box/features/user_profile/data/models/user_profile.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/strings/strings_manager.dart';

class FriendItem extends StatelessWidget {
  final Friends friend;
  const FriendItem({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(StringsManager.male,width:40),
        // Image.network(friend.profilePic!, width: 40),
        SizedBox(height: 10),
        Text(
          friend.fullName!,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}
