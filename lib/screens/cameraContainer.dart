import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/utils/camera-screen.dart';

class CameraContainer extends StatefulWidget {
  final List<CameraDescription> cameraArray;
  CameraContainer(this.cameraArray);
  @override
  _CameraContainerState createState() => _CameraContainerState();
}

class _CameraContainerState extends State<CameraContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CameraScreen(
        cameraArray: widget.cameraArray,
      ),
    );
  }
}
