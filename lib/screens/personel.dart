import 'package:flutter/material.dart';

class PersonelScreen extends StatefulWidget {
  @override
  _PersonelScreenState createState() => _PersonelScreenState();
}

class _PersonelScreenState extends State<PersonelScreen> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (Text(
        'Personel Screen',
        style: optionStyle,
      )),
    );
  }
}
