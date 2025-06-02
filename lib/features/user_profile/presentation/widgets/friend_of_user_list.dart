import 'package:chat_box/features/user_profile/data/models/user_profile.dart';
import 'package:chat_box/features/user_profile/presentation/widgets/friend_item.dart';
import 'package:flutter/material.dart';

class FriendsOfUserList extends StatelessWidget {
  final List<Friends> friends;
  const FriendsOfUserList({super.key,required this.friends});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: friends.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 5/3
      ),
      itemBuilder: (context, index) {
        return FriendItem(friend: friends[index],);
      },
    );
  }
}
