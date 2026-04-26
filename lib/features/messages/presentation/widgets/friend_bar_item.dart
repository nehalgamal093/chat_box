import 'package:flutter/material.dart';

import '../../../../core/resources/images/images_manager.dart';

class FriendBarItem extends StatelessWidget {
  final String image;
  const FriendBarItem({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height*.15,
      width: size.width*.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: getPicture(image),fit: BoxFit.cover)
      ),
    );
  }
}
getPicture(String profilePicture) {
  if (profilePicture.isEmpty) {
    return AssetImage(ImagesManager.sea);
  } else {
    return NetworkImage(profilePicture);
  }
}