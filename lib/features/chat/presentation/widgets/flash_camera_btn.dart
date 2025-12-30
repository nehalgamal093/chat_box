import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/colors/colors_manager.dart';

class FlashCameraBtn extends StatefulWidget {
  final CameraController controller;

  const FlashCameraBtn({super.key,required this.controller});

  @override
  State<FlashCameraBtn> createState() => _FlashCameraBtnState();
}

class _FlashCameraBtnState extends State<FlashCameraBtn> {
  bool flash = false;

  @override
  Widget build(BuildContext context) {

    return  !flash
        ? GestureDetector(
      onTap: () async {
        widget.controller.setFlashMode(FlashMode.torch);
        setState(() {
          flash = true;
        });
      },
      child: CircleAvatar(
        backgroundColor: ColorsManager.whiteColor,
        radius: 30,
        child: Icon(
          Icons.flash_on,
          color: ColorsManager.secondaryClr,
        ),
      ),
    ):GestureDetector(
      onTap: () async {
        widget.controller.setFlashMode(FlashMode.off);
        setState(() {
          flash = false;
        });
      },
      child: CircleAvatar(
        backgroundColor: ColorsManager.whiteColor,
        radius: 30,
        child: Icon(
          Icons.flash_off,
          color: ColorsManager.secondaryClr,
        ),
      ),
    );

  }
}
