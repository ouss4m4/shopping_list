import 'package:flutter/material.dart';
import 'package:shopping_list/models/ShopItem.dart';
import 'package:shopping_list/widgets/itemsList.dart';

class PersonelScreen extends StatefulWidget {
  @override
  _PersonelScreenState createState() => _PersonelScreenState();
}

class _PersonelScreenState extends State<PersonelScreen> {
  final List<ShopItem> data = [
    ShopItem(
        title: 'AAA Battreies',
        subtitle: 'Remote Controller',
        quantity: '2',
        imageUrl: 'http://placekitten.com/50/50')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ItemsList(
        shopItems: data,
      ),
    );
  }
}
