import 'package:flutter/material.dart';
import 'package:shopping_list/screens/addItem.dart';
import 'package:shopping_list/screens/personel.dart';
import 'package:shopping_list/screens/shared.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(),
    );
  }
}

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

  void onSubmitCalled(values) {
    print('you got data : $values');
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext defaultContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),

      body: Center(
        child: _selectedIndex == 0 ? PersonelScreen() : SharedScreen(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: defaultContext,
          builder: (BuildContext bc) {
            return AddItemForm(
                validForm: onSubmitCalled,
                caller: this._selectedIndex == 0 ? 'personel' : 'shared');
          },
        ),
        tooltip: 'Add an item',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
