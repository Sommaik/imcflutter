import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Image.asset('images/angular-logo.png'),
              buildEmailField(),
              buildPasswordField(),
              RaisedButton(
                child: Text("Login"),
                onPressed: () {},
              ),
              FlatButton(
                child: Text("Register new account"),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Please fill in your password.',
        prefixIcon: Icon(Icons.lock),
      ),
      obscureText: true,
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Please fill in email address',
        prefixIcon: Icon(Icons.email),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
