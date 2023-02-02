import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kindershala/utils/widgets.dart';

class SmartML extends StatefulWidget {
  static String routeName = "/smartml";
  const SmartML({Key? key}) : super(key: key);

  @override
  State<SmartML> createState() => _SmartMLState();
}

class _SmartMLState extends State<SmartML> {
  late List<CameraDescription>? cameras;
  late CameraController? cameraController;
  late CameraDescription? cameraDescription;

  final WriteBuffer allBytes = WriteBuffer();

  CustomPaint? customPaint;

  // FaceDetector? faceDetector = GoogleMlKit.vision.faceDetector(
  //     const FaceDetectorOptions(
  //         enableContours: true,
  //         enableClassification: true,
  //         enableLandmarks: true,
  //         enableTracking: true));
  //Size? size;
  //List<Face>? facelist;

  bool showCameraImage = false;
  double left = 0.0;
  double right = 0.0;
  double top = 0.0;
  int cameraposition = 1;
  IconData camIcon = Icons.camera_front;

  @override
  void initState() {
    //initCamera();
    //startCamera(1);
    getFeed(1);
    super.initState();
  }

  getFeed(cameraposition) async {
    cameras = await availableCameras();

    cameraController = CameraController(
      cameras![cameraposition],
      ResolutionPreset.ultraHigh,
      enableAudio: false,
    );

    await cameraController?.initialize().then((value) {
      if (!mounted) {
        return;
      }
      processImage();
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  processImage() {
    print('Image Processing');
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart ML'),
        actions: [
          GestureDetector(
            onTap: () {
              //getLiveFeed();
              //startCamera(1);
              //showStream();
              setState(() {
                showCameraImage = !showCameraImage;
                //   left = 0.0;
                //   right = 0.0;
                //   top = 0.0;
              });
            },
            child: const SizedBox(
              width: 50,
              height: 50,
              child: Icon(Icons.camera_alt_outlined),
            ),
          ),
          showCameraImage
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      cameraposition = cameraposition == 1 ? 0 : 1;
                      getFeed(cameraposition);
                    });
                  },
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(lensDirectionIcon(cameraposition)),
                  ),
                )
              : Container(),
        ],
      ),
      body: Stack(
        children: [
          PageBackground(context),
          showCameraImage
              ? Stack(
                  children: [
                    SizedBox(
                      height: height,
                      width: width,
                      child: CameraPreview(cameraController!),
                    ),
                    Positioned(
                        bottom: 0,
                        child: Container(
                          padding: EdgeInsets.all(30),
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              newMethod(),
                            ],
                          ),
                        ))
                  ],
                )
              : Container(
                  color: Colors.green.withOpacity(0.1),
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: [Text('Text Scanner')],
                  ),
                )
        ],
      ),
    );
  }

  Column newMethod() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              cameraposition = cameraposition == 1 ? 0 : 1;
              getFeed(cameraposition);
            });
          },
          child: Icon(
            lensDirectionIcon(cameraposition),
            size: 50,
            color: Colors.white,
          ),
        ),
        const Text(
          'Flip Camera',
          style: TextStyle(color: Colors.white, fontSize: 20),
        )
      ],
    );
  }
}

IconData lensDirectionIcon(int camFace) {
  switch (camFace) {
    case 1:
      return Icons.camera_front;
    case 0:
      return Icons.camera_rear;
    case 2:
      return Icons.camera;
    default:
      return Icons.device_unknown;
  }
}

class CamIcons extends StatelessWidget {
  final int cameraPosition;
  final String iconText;
  final Function ontap;

  const CamIcons(
      {Key? key,
      required this.cameraPosition,
      required this.iconText,
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: ontap(),
          child: Icon(
            lensDirectionIcon(cameraPosition),
            size: 50,
            color: Colors.white,
          ),
        ),
        const Text(
          'Flip Camera',
          style: TextStyle(color: Colors.white, fontSize: 20),
        )
      ],
    );
  }
}
