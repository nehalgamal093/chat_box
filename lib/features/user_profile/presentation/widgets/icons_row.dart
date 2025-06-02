import 'package:flutter/material.dart';

import '../../../../core/common_widgets/circle_icon.dart';
import '../../../../core/resources/images/images_manager.dart';

class IconsRow extends StatelessWidget {
  final String friendStatus;
  const IconsRow({super.key,required this.friendStatus});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleIcon(icon: ImagesManager.chat),
        SizedBox(width: 30),
        CircleIcon(icon: ImagesManager.video),
        SizedBox(width: 30),
        CircleIcon(icon: ImagesManager.call),
        SizedBox(width: 30),
        CircleIcon(icon: getFriendStatus(friendStatus)),
      ],
    );
  }
  String getFriendStatus(String status){
    switch(status){
      case 'friends':
        return ImagesManager.friends;
      case 'request_sent':
        return ImagesManager.friendsPending;
      default:
        return ImagesManager.friendRequest;
    }
  }
}
