import 'package:camera/camera.dart';

class CameraHandler {
  static Future<CameraController> initializeCamera(
      {CameraDescription? camera}) async {
    CameraController? controller;
    if (controller != null) {
      await controller.dispose();
    }
    final cameras = await availableCameras();
    if (camera == null) {
      controller = CameraController(
        cameras[0],
        ResolutionPreset.medium,
      );
    } else {
      controller = CameraController(
        camera,
        ResolutionPreset.medium,
      );
    }
    return controller;
  }

  static Future<CameraController> flipCamera(
      CameraController controller) async {
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
    if (controller != null) {
      if (controller.description.lensDirection == CameraLensDirection.back) {
        return initializeCamera(camera: frontCamera!);

      } else {
        return initializeCamera(
          camera: backCamera!,
        );
      }
    }
    return initializeCamera();
  }
}
