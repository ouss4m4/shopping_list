import 'package:flutter/material.dart';
import 'package:shopping_list/models/ShopItem.dart';
import 'package:shopping_list/widgets/itemSingle.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemsList extends StatelessWidget {
  final List<ShopItem> shopItems;
  final Function delegateRemovingItem;
  final Function delegateEditingItem;
  /* final Function delegateCompleteItem; */
  ItemsList(
      {@required this.shopItems,
      @required this.delegateRemovingItem,
      /*  @required this.delegateCompleteItem, */
      @required this.delegateEditingItem});

  @override
  Widget build(BuildContext context) {
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
                onTap: () => delegateRemovingItem(shopItems[index]),
              ),
              IconSlideAction(
                caption: 'Edit',
                color: Colors.blue,
                icon: Icons.edit,
                onTap: () => delegateEditingItem(shopItems[index]),
              ),
              /*  IconSlideAction(
                caption: 'Complete',
                color: Colors.green,
                icon: Icons.check_circle,
                onTap: () => delegateCompleteItem(shopItems[index]),
              ), */
            ],
          );
        },
        itemCount: shopItems.length,
      ),
    );
  }
}
