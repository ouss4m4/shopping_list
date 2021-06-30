import 'package:flutter/material.dart';
import 'package:shopping_list/models/ShopItem.dart';

class PersonelProvider with ChangeNotifier {
  final ShopItem exampleItem = new ShopItem(
      imageUrl: '',
      quantity: '8',
      subtitle: 'Playstation controller size',
      title: 'Batteries');
  List<ShopItem> _itemsList = [];

  List<ShopItem> get shopItems {
    if (_itemsList.length < 1) {
      _itemsList.add(exampleItem);
    }

    return _itemsList;
  }

  set shopItems(List<ShopItem> items) {
    _itemsList = items;
    notifyListeners();
  }

  void removeItem(ShopItem itemToRemove) {
    bool result = shopItems.remove(itemToRemove);

    if (result) {
      notifyListeners();
    }
  }

  void editItem(ShopItem itemToEdit, ShopItem newValue) {
    int index = shopItems.indexOf(itemToEdit);
    if (index > -1) {
      shopItems[index] = newValue;
      notifyListeners();
    }
  }

  void addItem(ShopItem itemToAdd) {
    shopItems.add(itemToAdd);
    notifyListeners();
  }
}
