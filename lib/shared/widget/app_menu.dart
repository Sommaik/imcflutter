import 'package:flutter/material.dart';

class AppMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('Home'),
          leading: Icon(Icons.home),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        ListTile(
          title: Text('Counter'),
          leading: Icon(Icons.timer),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/counter');
          },
        ),
        ListTile(
          title: Text('Full Counter'),
          leading: Icon(Icons.timer),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/full_counter');
          },
        ),
        ListTile(
          title: Text('My Home'),
          leading: Icon(Icons.access_alarm),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/my_home');
          },
        ),
        ListTile(
          title: Text('Signout'),
          onTap: () {
            // TODO: signout event
          },
        )
      ],
    );
  }
}
