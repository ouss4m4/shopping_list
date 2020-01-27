import 'package:flutter/material.dart';
import 'package:shopping_list/widgets/itemsList.dart';

class PersonelScreen extends StatefulWidget {
  @override
  _PersonelScreenState createState() => _PersonelScreenState();
}

class _PersonelScreenState extends State<PersonelScreen> {
  final List<String> data = ['AAA Batteries', 'A4 Paper', 'Power Cord PS4'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ItemsList(
        shopItems: data,
      ),
    );
  }
}
