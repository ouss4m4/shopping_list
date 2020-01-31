import 'package:flutter/material.dart';
import 'package:shopping_list/models/ShopItem.dart';
import 'package:shopping_list/widgets/itemSingle.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemsList extends StatelessWidget {
  final List<ShopItem> shopItems;
  ItemsList({this.shopItems});

  @override
  Widget build(BuildContext context) {
    handleActions(ShopItem item, String action) {
      print(item);
      print(action);
      if (action == 'Remove') {
        final snackBar = SnackBar(content: Text('${item.title} removed'));
        Scaffold.of(context).showSnackBar(snackBar);
      }
    }

    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: ItemSingle(shopItems[index]),
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Remove',
                color: Colors.red,
                icon: Icons.delete_forever,
                onTap: () => handleActions(shopItems[index], 'Remove'),
              ),
              IconSlideAction(
                caption: 'Edit',
                color: Colors.blue,
                icon: Icons.edit,
                onTap: () => handleActions(shopItems[index], 'Edit'),
              ),
              IconSlideAction(
                caption: 'Complete',
                color: Colors.green,
                icon: Icons.check_circle,
                onTap: () => handleActions(shopItems[index], 'Complete'),
              ),
            ],
          );
        },
        itemCount: shopItems.length,
      ),
    );
  }
}
