import 'package:camera/camera.dart';
import 'package:chat_box/core/camera_handler/camera_handler.dart';
import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/features/camera_screen/presentation/screens/view_photo_screen.dart';
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

  Future<void> init() async{
    controller =  await CameraHandler.initializeCamera();
    if (mounted) {
      setState(() {
      });}
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
  bool isflash = false;
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
                    isflash
                        ? GestureDetector(
                            onTap: () async {
                              controller.setFlashMode(FlashMode.off);
                              setState(() {
                                isflash = false;
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: ColorsManager.whiteColor,
                              radius: 30,
                              child: Icon(
                                Icons.flash_off,
                                color: ColorsManager.blackColor,
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () async {
                              controller.setFlashMode(FlashMode.off);
                              setState(() {
                                isflash = true;
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: ColorsManager.whiteColor,
                              radius: 30,
                              child: Icon(
                                Icons.flash_on,
                                color: ColorsManager.blackColor,
                              ),
                            ),
                          ),
                    GestureDetector(
                      onTap: () async {
                        try {
                          await controller.initialize();
                          final image = await controller!.takePicture();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewPhotoScreen(
                                path: image.path,
                                user: widget.user,
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
                    ),
                    GestureDetector(
                      onTap: () async {

                       await _flipCamera();

                      },
                      child: CircleAvatar(
                        backgroundColor: ColorsManager.whiteColor,
                        radius: 30,
                        child: Icon(
                          Icons.flip_camera_android_outlined,
                          color: ColorsManager.blackColor,
                        ),
                      ),
                    ),
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
    if (mounted) setState(() {}); // rebuild UI with new controller
  }
 }

//179