import 'package:flutter/material.dart';
import 'package:shopping_list/models/ShopItem.dart';

class ItemSingle extends StatelessWidget {
  final ShopItem shopItem;
  ItemSingle(this.shopItem);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: SizedBox(
            width: 90,
            height: 90,
            child: Image.network(
              '${shopItem.imageUrl}',
            ) // no matter how big it is, it won't overflow
            ),
        title: Text('${shopItem.title}'),
        subtitle: Text('${shopItem.subtitle}'),
        trailing: CircleAvatar(
          child: Text(shopItem.quantity),
        ));
  }
}
