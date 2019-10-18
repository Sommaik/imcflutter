import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:imcflutter/shared/widget/app_menu.dart';
import 'package:intl/intl.dart';

class ExampleFormPage extends StatefulWidget {
  @override
  _ExampleFormPageState createState() => _ExampleFormPageState();
}

class _ExampleFormPageState extends State<ExampleFormPage> {
  String sex = 'M';
  bool over18 = false;
  List<String> provices = ['', 'BKK', 'Outbound'];
  String provice = 'BKK';
  final _format = DateFormat('dd/MM/yyyy');

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
              buildCheckBoxField(),
              buildSelectField(),
              buildDateField(),
            ],
          ),
        ),
      ),
    );
  }

  DateTimeField buildDateField() {
    return DateTimeField(
      decoration: InputDecoration(labelText: 'Birth Date'),
      format: _format,
      onShowPicker: (context, currentValue) {
        return showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
      },
    );
  }

  InputDecorator buildSelectField() {
    return InputDecorator(
      decoration: InputDecoration(labelText: 'Province'),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: provice,
          onChanged: (value) {
            setState(() {
              provice = value;
            });
          },
          items: provices
              .map(
                (value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Row buildCheckBoxField() {
    return Row(
      children: <Widget>[
        Checkbox(
          onChanged: (value) {
            setState(() {
              over18 = value;
            });
          },
          value: over18,
        ),
        Text('Over 18 years old.')
      ],
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
