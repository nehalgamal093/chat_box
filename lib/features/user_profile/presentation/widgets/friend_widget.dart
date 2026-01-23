import 'package:flutter/material.dart';
import 'package:chat_box/features/user_profile/data/models/user_profile.dart';

import '../../../../core/resources/images/images_manager.dart';

class FriendWidget extends StatelessWidget {
  final Friends friend;
  const FriendWidget({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    print('🎈🎈🎈🎈 ${friend.profilePicture}');
    return Column(
      children: [
        Container(
          child:
              friend.profilePicture != null || friend.profilePicture!.isNotEmpty
                  ? Image.network(friend.profilePicture!)
                  : Image.asset(ImagesManager.avatar),
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
