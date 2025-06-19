import 'package:camera/camera.dart';
import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/features/camera_screen/presentation/screens/view_photo_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_box/features/chat/data/models/message.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({
    super.key,
    required this.camera,
    required this.frontCamera,
    required this.id,
    required this.photo,
    required this.fullName,
    required this.gender,
  });
  final CameraDescription camera;
  final CameraDescription frontCamera;
  final String id;
  final String fullName;
  final String photo;
  final String gender;
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  Future<void> _initializeCamera(CameraDescription camera) async {
    if (_controller != null) {
      await _controller!.dispose(); // Dispose old controller
    }

    _controller = CameraController(
      camera,
      ResolutionPreset.medium, // Adjust resolution as needed
    );

    try {
      _initializeControllerFuture = _controller!.initialize();
      if (mounted) setState(() {});
    } catch (e) {
      print("Error initializing camera: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeCamera(widget.camera);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(children: [Expanded(child: CameraPreview(_controller!))]),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(color: Colors.transparent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        _controller?.setFlashMode(FlashMode.torch);
                      },
                      child: CircleAvatar(
                        backgroundColor: ColorsManager.whiteColor,
                        radius: 30,
                        child: Icon(
                          Icons.flash_off,
                          color: ColorsManager.blackColor,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        try {
                          await _initializeControllerFuture;
                          final image = await _controller!.takePicture();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => ViewPhotoScreen(
                                    path: image.path,
                                    id: widget.id,
                                    image: widget.photo,
                                    fullName: widget.fullName,
                                    gender: widget.gender,
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
                        flipCamera();
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

  void flipCamera() async {
    List<CameraDescription> cameras = await availableCameras();
    CameraDescription? frontCamera;
    CameraDescription? backCamera;

    for (CameraDescription camera in cameras) {
      if (camera.lensDirection == CameraLensDirection.front) {
        frontCamera = camera;
      } else if (camera.lensDirection == CameraLensDirection.back) {
        backCamera = camera;
      }
    }
    if (_controller != null) {
      if (_controller!.description.lensDirection == CameraLensDirection.back) {
        _initializeCamera(frontCamera!);
      } else {
        _initializeCamera(backCamera!);
      }
    }
  }
}
