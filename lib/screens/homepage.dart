import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/providers/personalProvider.dart';
import 'package:shopping_list/screens/personel.dart';
import 'package:shopping_list/screens/shared.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  final String title = 'Shopping List';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext defaultContext) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: _selectedIndex == 0
            ? ChangeNotifierProvider(
                create: (_) => PersonelProvider(),
                child: PersonelScreen(),
              )
            : ChangeNotifierProvider(
                create: (_) => PersonelProvider(),
                child: SharedScreen(),
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Personel'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('Shared'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
