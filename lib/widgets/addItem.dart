import 'package:flutter/material.dart';

import 'package:shopping_list/models/ShopItem.dart';

class AddItemForm extends StatefulWidget {
  final Function validForm;
  final ShopItem preset;
  AddItemForm({@required this.validForm, this.preset});
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
  String imagePath = '';
  void takePictureClicked(BuildContext ctx) async {
    // push camera container ??
    final pathFromCameraRoute = await Navigator.pushNamed(
      ctx,
      '/camera',
    );
    print('we got the dam $pathFromCameraRoute');
    imagePath = pathFromCameraRoute;
  }

  @override
  void initState() {
    var itemToEdit = widget.preset;
    if (itemToEdit != null) {
      this.nameController.text = itemToEdit.title;
      this.subtitleController.text = itemToEdit.subtitle;
      this.quantityController.text = itemToEdit.quantity;
      imagePath = itemToEdit.imageUrl;
    }
    super.initState();
  }

  void emitFormValues() {
    final ShopItem testItem = new ShopItem(
        title: nameController.text,
        subtitle: subtitleController.text,
        quantity: quantityController.text,
        imageUrl: imagePath);
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
                      onPressed: () => this.takePictureClicked(context),
                    ),
                  ),
                  Container(
                    width: 130,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          emitFormValues();
                        }
                      },
                      child: Text('Submit'),
                    ),
                  )
                ],
              )
            ]));
  }
}
