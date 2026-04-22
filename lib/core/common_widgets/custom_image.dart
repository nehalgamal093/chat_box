import 'package:flutter/material.dart';
import '../resources/images/images_manager.dart';

class CustomImage extends StatelessWidget {
  final String profilePicture;
  const CustomImage({super.key, required this.profilePicture});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image:DecorationImage(image:  getPicture(profilePicture))
      ),

    );
  }

  getPicture(String profilePicture) {
    if (profilePicture.isEmpty) {
      return AssetImage(ImagesManager.avatar);
    } else {
      return NetworkImage(profilePicture);
    }
  }
}
