import 'package:flutter/material.dart';
import 'package:imcflutter/shared/widget/app_menu.dart';

class ExampleFormPage extends StatefulWidget {
  @override
  _ExampleFormPageState createState() => _ExampleFormPageState();
}

class _ExampleFormPageState extends State<ExampleFormPage> {
  String sex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Form'),
      ),
      drawer: Drawer(
        child: AppMenu(),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          child: ListView(
            children: <Widget>[
              buildRadioField(),
            ],
          ),
        ),
      ),
    );
  }

  Row buildRadioField() {
    return Row(
      children: <Widget>[
        Radio(
          value: 'M',
          groupValue: sex,
          onChanged: (value) {
            setState(() {
              sex = value;
            });
          },
        ),
        Text('Male'),
        Radio(
            value: 'F',
            groupValue: sex,
            onChanged: (value) {
              setState(() {
                sex = value;
              });
            }),
        Text('Female')
      ],
    );
  }
}
