import 'package:camera/camera.dart';
import 'package:chat_box/features/messages/data/models/chatted_users.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/colors/colors_manager.dart';
import '../../../camera_screen/presentation/screens/view_photo_screen.dart';

class CaptureImageButton extends StatelessWidget {
  final CameraController controller;
  final User user;
  const CaptureImageButton({super.key,required this.controller,required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          final image = await controller.takePicture();
          if (!context.mounted) return;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ViewPhotoScreen(
                path: image.path,
                user:user,
              ),
            ),
          );
        } catch (e) {
          print(e);
        }
      },
      child: CircleAvatar(
        backgroundColor: ColorsManager.cyan,
        radius: 40,
      ),
    );
  }
}
