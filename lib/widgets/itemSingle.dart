import 'package:flutter/material.dart';
import 'package:shopping_list/models/ShopItem.dart';

class ItemSingle extends StatelessWidget {
  final ShopItem shopItem;
  ItemSingle(this.shopItem);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        '${shopItem.imageUrl}',
        fit: BoxFit.contain,
      ),
      title: Text('${shopItem.title}'),
      subtitle: Text('${shopItem.subtitle}'),
      trailing: Text(shopItem.quantity),
    );
  }
}
