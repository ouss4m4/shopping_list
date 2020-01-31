import 'package:flutter/material.dart';
import 'package:shopping_list/models/ShopItem.dart';
import 'package:shopping_list/widgets/itemsList.dart';

class PersonelScreen extends StatefulWidget {
  @override
  _PersonelScreenState createState() => _PersonelScreenState();
}

class _PersonelScreenState extends State<PersonelScreen> {
  final List<ShopItem> data = [
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ItemsList(
        shopItems: data,
      ),
    );
  }
}
