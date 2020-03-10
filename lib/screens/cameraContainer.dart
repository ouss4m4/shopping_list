import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/utils/camera-screen.dart';
import 'package:shopping_list/utils/picture-preview.dart';

class CameraContainer extends StatefulWidget {
  final List<CameraDescription> cameraArray;
  CameraContainer(this.cameraArray);
  @override
  _CameraContainerState createState() => _CameraContainerState();
}

class _CameraContainerState extends State<CameraContainer> {
  bool isInPreview = false;
  String previewPath = '';
  void retakePicture() {
    setState(() {
      previewPath = '';
      isInPreview = false;
    });
  }

  void usePicture() {
    Navigator.pop(context, previewPath);
  }

  void passPicturePath(String path) {
    setState(() {
      previewPath = path;
      isInPreview = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isInPreview && previewPath.isNotEmpty
        ? Scaffold(
            resizeToAvoidBottomPadding: true,
            appBar: AppBar(
              title: Text('Preview'),
              centerTitle: true,
            ),
            body: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: usePicture,
                        child: Text('Use Photo'),
                      ),
                      RaisedButton(
                        onPressed: retakePicture,
                        child: Text('Take new'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 500,
                    width: 500,
                    child: DisplayPictureScreen(
                      imagePath: previewPath,
                    ),
                  ),
                ],
              ),
            ),
          )
        : CameraScreen(
            cameraArray: widget.cameraArray,
            onPictureTaken: passPicturePath,
          );
  }
}

// A widget that displays the picture taken by the user.
