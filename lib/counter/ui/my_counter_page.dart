import 'package:flutter/material.dart';

class MyCounterPage extends StatelessWidget {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My First App.... '),
      ),
      body: Center(
        child: Text(
          'Your number is $counter',
          style: TextStyle(
            fontSize: 25,
            color: Colors.cyan,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          counter += 1;
          print('numer = $counter');
        },
      ),
    );
  }
}
