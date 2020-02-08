import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/providers/personalProvider.dart';

import 'package:shopping_list/widgets/itemsList.dart';

class PersonelScreen extends StatefulWidget {
  @override
  _PersonelScreenState createState() => _PersonelScreenState();
}

class _PersonelScreenState extends State<PersonelScreen> {
  @override
  Widget build(BuildContext context) {
    final shopItemsProvider = Provider.of<PersonelProvider>(context);
    return Container(
      child: ItemsList(
        shopItems: shopItemsProvider.shopItems,
        delegateRemovingItem: shopItemsProvider.removeItem,
        delegateCompleteItem: shopItemsProvider.setItemComplete,
        delegateEditingItem: shopItemsProvider.editItem,
      ),
    );
  }
}
