import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shopping_list/models/ShopItem.dart';

class ItemSingle extends StatelessWidget {
  final ShopItem shopItem;
  ItemSingle(this.shopItem);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: SizedBox(
            width: 50,
            height: 90,
            child: (shopItem.imageUrl != null && shopItem.imageUrl.isNotEmpty)
                ? Image.file(
                    File(shopItem.imageUrl),
                    fit: BoxFit.fill,
                  )
                : Center(
                    child: Text(
                      '${shopItem.title[0].toUpperCase()}',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          backgroundColor: Colors.deepOrange),
                      textScaleFactor: 3,
                    ),
                  )), // no matter how big it is, it won't overflow
        title: Text('${shopItem.title}'),
        subtitle: Text('${shopItem.subtitle}'),
        trailing: CircleAvatar(
          child: Text(shopItem.quantity),
        ));
  }
}
