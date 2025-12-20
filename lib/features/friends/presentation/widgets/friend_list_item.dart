import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:flutter/material.dart';
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
            CircleAvatar(
                backgroundImage: NetworkImage(dataList.gender == 'female'
                    ? StringsManager.female
                    : StringsManager.male)),
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
