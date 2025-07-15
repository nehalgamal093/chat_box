import 'package:flutter/material.dart';
import '../../../../core/resources/images/images_manager.dart';
import '../../../../core/resources/strings/strings_manager.dart';
import '../../../messages/data/models/chatted_users.dart';
import '../../../user_profile/presentation/screens/user_profile_screen.dart';

PreferredSizeWidget chatAppBar(BuildContext context, User user) {
  return AppBar(
    title: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserProfileScreen(id: user.id!),
          ),
        );
      },
      child: Row(
        children: [
          Badge(
            backgroundColor: Colors.green,
            smallSize: 10,
            child: Image.network(
              user.gender == "male"
                  ? StringsManager.male
                  : StringsManager.female,
              width: 40,
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.fullName!,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 16),
              ),
              Text('Active now', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
    ),
    centerTitle: false,
    actions: [
      ImageIcon(AssetImage(ImagesManager.call)),
      SizedBox(width: 15),
      ImageIcon(AssetImage(ImagesManager.video)),
      SizedBox(width: 20),
    ],
  );
}
