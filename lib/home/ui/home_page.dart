import 'package:flutter/material.dart';
import 'package:imcflutter/shared/widget/app_menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: AppMenu(),
    );
  }
}
