import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraProvider with ChangeNotifier {
  List<CameraDescription> _cameras;
  set camerasArray(List<CameraDescription> cameras) {
    this._cameras = cameras;
  }

  List<CameraDescription> get camerasArray {
    return this._cameras;
  }
}
