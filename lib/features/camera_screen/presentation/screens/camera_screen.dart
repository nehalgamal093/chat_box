import 'package:camera/camera.dart';
import 'package:chat_box/core/camera_handler/camera_handler.dart';
import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/features/chat/presentation/widgets/capture_image_button.dart';
import 'package:chat_box/features/chat/presentation/widgets/flash_camera_btn.dart';
import 'package:chat_box/features/chat/presentation/widgets/flip_camera_button.dart';
import 'package:flutter/material.dart';
import '../../../messages/data/models/chatted_users.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({
    super.key,
    required this.user,
  });
  final User user;
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;

  Future<void> init() async {
    controller = await CameraHandler.initializeCamera();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(children: [Expanded(child: CameraPreview(controller))]),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(color: Colors.transparent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlashCameraBtn(
                      controller: controller,
                    ),
                    CaptureImageButton(
                      controller: controller,
                      user: widget.user,
                    ),
                    FlipCameraButton(onTap: () async {
                      await _flipCamera();
                    })
                  ],
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: ColorsManager.cyan),
          );
        }
      },
    );
  }

  Future<void> _flipCamera() async {
    controller = await CameraHandler.flipCamera(controller);
    if (mounted) setState(() {});
  }
}
//179