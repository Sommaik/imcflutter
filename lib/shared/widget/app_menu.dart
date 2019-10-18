import 'package:flutter/material.dart';

class AppMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Counter'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/counter');
            },
          ),
          ListTile(
            title: Text('Signout'),
            onTap: () {
              // TODO: signout event
            },
          )
        ],
      ),
    );
  }
}
