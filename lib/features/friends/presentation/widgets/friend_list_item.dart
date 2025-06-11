import 'package:flutter/material.dart';

import '../../../chat/presentation/screens/chat_screen.dart';
import '../../../user_profile/presentation/screens/user_profile_screen.dart';
import '../../data/models/friends.dart';

class FriendListItem extends StatelessWidget {
  final DataList dataList;
  const FriendListItem({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserProfileScreen(id: dataList.id!),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            CircleAvatar(child: Image.network(dataList.profilePic!)),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dataList.fullName!),
                SizedBox(height: 5),
                Text(
                  'Round and round ✍',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
