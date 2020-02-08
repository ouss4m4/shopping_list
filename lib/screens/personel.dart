import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/models/ShopItem.dart';
import 'package:shopping_list/providers/personalProvider.dart';
import 'package:shopping_list/widgets/itemsList.dart';

import 'addItemModal.dart';

class PersonelScreen extends StatefulWidget {
  @override
  _PersonelScreenState createState() => _PersonelScreenState();
}

class _PersonelScreenState extends State<PersonelScreen> {
  @override
  Widget build(BuildContext context) {
    final shopItemsProvider = Provider.of<PersonelProvider>(context);

    void addItemToList(ShopItem item) {
      shopItemsProvider.addItem(item);
      Navigator.pop(context);
    }

    void showEditItem(ShopItem item) {
      newValue(ShopItem newDetails) {
        shopItemsProvider.editItem(item, newDetails);
        Navigator.pop(context);
      }

      showAddItemModal(context, newValue, preset: item);
    }

    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ItemsList(
              shopItems: shopItemsProvider.shopItems,
              delegateRemovingItem: shopItemsProvider.removeItem,
              /*   delegateCompleteItem: shopItemsProvider.setItemComplete, */
              delegateEditingItem: showEditItem,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 13),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () => showAddItemModal(context, addItemToList),
                tooltip: 'Add an item',
                child: Icon(Icons.add),
              ),
            ),
          )
        ]);
  }
}
