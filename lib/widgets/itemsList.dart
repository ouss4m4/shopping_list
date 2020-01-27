import 'package:flutter/material.dart';

class ItemsList extends StatelessWidget {
  final List<String> shopItems;
  ItemsList({this.shopItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              child: IconButton(
                icon: Icon(Icons.launch),
                onPressed: null,
              ),
            ),
            title: Text('${shopItems[index]}'),
            subtitle: Text('Urgent Please'),
          );
        },
        itemCount: shopItems.length,
      ),
    );
  }
}
