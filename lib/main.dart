import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:shopping_list/screens/cameraContainer.dart';
import 'package:shopping_list/screens/homepage.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();
  // Get a specific camera from the list of available cameras.
  final camerasArray = cameras;
  runApp(MyApp(camerasArray: camerasArray));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> camerasArray;

  MyApp({this.camerasArray});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/camera': (context) => CameraContainer(camerasArray),
      },
    );
  }
}
