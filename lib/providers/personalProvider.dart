import 'package:flutter/material.dart';
import 'package:shopping_list/models/ShopItem.dart';

class PersonelProvider with ChangeNotifier {
  List<ShopItem> _itemsList = [
    ShopItem(
        title: 'AAA Battreies',
        subtitle: 'Remote Controller',
        quantity: '2',
        imageUrl:
            'https://previews.123rf.com/images/koya79/koya791305/koya79130500020/19775806-aaa-battery-3d-icon.jpg'),
    ShopItem(
        title: 'Cat food',
        subtitle: 'bring a fish meal if possible',
        quantity: '1',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTdxIdLMWcIIxd2fg_wUCdPRXQCkuM_e5muLQfo02WmPlu277Uo'),
    ShopItem(
        title: 'A4 Papers',
        subtitle: '',
        quantity: '1',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRXGZCt_2WbxVFGclJkj6T8lyNAKEmiaeFgzJHA6u_YczfNi9cy'),
    ShopItem(
        title: 'Paper rolls',
        subtitle: '',
        quantity: '2',
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/61%2BnMoPQbrL._AC_SL1500_.jpg')
  ];

  List<ShopItem> get shopItems => _itemsList;

  set shopItems(List<ShopItem> items) {
    _itemsList = items;
    notifyListeners();
  }

  void removeItem(ShopItem itemToRemove) {
    print('removing using provider');
    bool result = shopItems.remove(itemToRemove);

    if (result) {
      notifyListeners();
    }
  }

  void editItem(ShopItem itemToEdit, ShopItem newValue) {
    print('item editing in provider');
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

/*   void setItemComplete(ShopItem itemToComplete) {
    int index = shopItems.indexOf(itemToComplete);
    if (index > -1) {
      shopItems[index] = itemToComplete;
      notifyListeners();
    }
  } */
}
