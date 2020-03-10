import 'package:flutter/material.dart';
import 'package:shopping_list/models/ShopItem.dart';

class PersonelProvider with ChangeNotifier {
  List<ShopItem> _itemsList = [];

  List<ShopItem> get shopItems => _itemsList;

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
