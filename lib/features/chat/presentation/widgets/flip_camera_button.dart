import 'package:flutter/material.dart';
import '../../../../core/resources/colors/colors_manager.dart';

class FlipCameraButton extends StatelessWidget {
  final void Function() onTap;
  const FlipCameraButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: CircleAvatar(
        backgroundColor: ColorsManager.whiteColor,
        radius: 30,
        child: Icon(
          Icons.flip_camera_android_outlined,
          color: ColorsManager.secondaryClr,
        ),
      ),
    );
  }
}
