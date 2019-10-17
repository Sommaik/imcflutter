import 'package:flutter/material.dart';
// import 'counter/ui/ui.dart';
import 'package:imcflutter/counter/ui/ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyFullCounterPage(),
    );
  }
}
