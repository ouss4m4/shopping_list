import 'package:flutter/material.dart';
import 'package:shopping_list/models/ShopItem.dart';
import 'package:shopping_list/widgets/itemSingle.dart';

class ItemsList extends StatelessWidget {
  final List<ShopItem> shopItems;
  ItemsList({this.shopItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ItemSingle(shopItems[index]);
        },
        itemCount: shopItems.length,
      ),
    );
  }
}
