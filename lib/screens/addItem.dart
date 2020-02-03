import 'package:flutter/material.dart';
import 'package:shopping_list/models/ShopItem.dart';

class AddItemForm extends StatefulWidget {
  final String caller;
  final Function validForm;
  AddItemForm({this.caller, @required this.validForm});
  @override
  AddItemFormState createState() {
    return AddItemFormState();
  }
}

class AddItemFormState extends State<AddItemForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController subtitleController = new TextEditingController();
  final TextEditingController quantityController = new TextEditingController();

  void emitFormValues() {
    final ShopItem testItem = new ShopItem(
        title: nameController.text,
        subtitle: subtitleController.text,
        quantity: quantityController.text,
        imageUrl: 'http://placekitten.com/200/300');
    widget.validForm(testItem);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                controller: nameController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: subtitleController,
                decoration: InputDecoration(labelText: 'Information'),
              ),
              TextFormField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Quantity'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    child: RaisedButton(
                      child: Text(
                        'Add a Picture',
                      ),
                      onPressed: () => null,
                    ),
                  ),
                  Container(
                    width: 130,
                    child: RaisedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          print('form valid, add it');
                          emitFormValues();
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Submit'),
                    ),
                  )
                ],
              )
            ])
        // Add TextFormFields and RaisedButton here.
        );
  }
}
