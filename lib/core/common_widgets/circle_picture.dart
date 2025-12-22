import 'package:chat_box/core/resources/images/images_manager.dart';
import 'package:flutter/material.dart';

class CirclePicture extends StatelessWidget {
  final String imageUrl;
  final double radius;
  const CirclePicture({super.key, required this.imageUrl,required this.radius});

  @override
  Widget build(BuildContext context) {
    return
        CircleAvatar(
            radius: radius,
            backgroundImage:imageUrl.isEmpty || imageUrl == null
                ? AssetImage(ImagesManager.avatar): NetworkImage(imageUrl),
          );
  }
}
