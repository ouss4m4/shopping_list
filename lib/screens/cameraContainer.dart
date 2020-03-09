import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/utils/camera-screen.dart';
import 'dart:io';

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

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}
