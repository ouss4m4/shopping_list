import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/models/ShopItem.dart';
import 'package:shopping_list/providers/personalProvider.dart';
import 'package:shopping_list/screens/addItem.dart';
import 'package:shopping_list/widgets/addItemModal.dart';

import 'package:shopping_list/widgets/itemsList.dart';

class PersonelScreen extends StatefulWidget {
  @override
  _PersonelScreenState createState() => _PersonelScreenState();
}

class _PersonelScreenState extends State<PersonelScreen> {
  @override
  Widget build(BuildContext context) {
    final shopItemsProvider = Provider.of<PersonelProvider>(context);
    void addItemToList(ShopItem item) {
      Navigator.pop(context);
      shopItemsProvider.addItem(item);
    }

    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ItemsList(
              shopItems: shopItemsProvider.shopItems,
              delegateRemovingItem: shopItemsProvider.removeItem,
              delegateCompleteItem: shopItemsProvider.setItemComplete,
              delegateEditingItem: shopItemsProvider.editItem,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 13),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () => showAddItemModal(context),
                tooltip: 'Add an item',
                child: Icon(Icons.add),
              ),
            ),
          )
        ]);
  }
}
