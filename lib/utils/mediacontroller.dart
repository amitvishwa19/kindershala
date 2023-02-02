import 'package:camera/camera.dart';
////import 'package:firebase_ml_vision/firebase_ml_vision.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:google_ml_kit/google_ml_kit.dart';

enum CameraDirection { front, rear }

late List<CameraDescription>? cameras;
late CameraController? camera;
late CameraLensDirection? cameraLensDirection;

class MediaController {
  MediaController._();

  static Future<CameraDescription> getCamera(
      CameraLensDirection cameraLensDirection) async {
    return await availableCameras().then((List<CameraDescription> cameras) =>
        cameras.firstWhere((CameraDescription cameraDescription) =>
            cameraDescription.lensDirection == cameraLensDirection));
  }

  static Uint8List conconatePlanes(List<Plane> planes) {
    final WriteBuffer allBytes = WriteBuffer();

    for (Plane plane in planes) {
      allBytes.done().buffer.asUint8List();
    }
    return allBytes.done().buffer.asUint8List();
  }

  static getCameraFeed() async {
    print('Getting Camera Feed');
    cameras = await availableCameras();

    // camera = CameraController(
    //   cameras![1],
    //   ResolutionPreset.ultraHigh,
    //   enableAudio: false,
    // );

    camera = CameraController(
      cameras![0],
      ResolutionPreset.ultraHigh,
      enableAudio: false,
    );

    return camera;
  }

  IconData lensDirectionIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.back:
        return Icons.camera_rear;
      case CameraLensDirection.front:
        return Icons.camera_front;
      case CameraLensDirection.external:
        return Icons.camera;
      default:
        return Icons.device_unknown;
    }
  }
}
