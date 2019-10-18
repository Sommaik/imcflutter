import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imcflutter/shared/bloc/bloc.dart';

class AppMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppBloc appBloc = BlocProvider.of<AppBloc>(context);
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
          title: Text('Example Form'),
          leading: Icon(Icons.library_books),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/example_form');
          },
        ),
        ListTile(
          title: Text('Post'),
          leading: Icon(Icons.poll),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/post');
          },
        ),
        ListTile(
          title: Text('Sign Out'),
          leading: Icon(Icons.exit_to_app),
          onTap: () {
            appBloc.dispatch(SignOutAppEvent());
          },
        )
      ],
    );
  }
}
