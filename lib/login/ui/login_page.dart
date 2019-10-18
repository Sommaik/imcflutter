import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imcflutter/login/bloc/bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) => Scaffold(
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
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      loginBloc.dispatch(
                        LogingInEvent(email: email, password: password),
                      );
                    }
                  },
                ),
                FlatButton(
                  child: Text("Register new account"),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/register');
                  },
                )
              ],
            ),
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
      onSaved: (value) {
        password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please input your password..';
        } else
          return null;
      },
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
      onSaved: (value) {
        email = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please input your email';
        } else
          return null;
      },
    );
  }
}
