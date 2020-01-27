import 'package:flutter/material.dart';

class SharedScreen extends StatefulWidget {
  @override
  _SharedScreenState createState() => _SharedScreenState();
}

class _SharedScreenState extends State<SharedScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Shared Screen',
      ),
    );
  }
}
