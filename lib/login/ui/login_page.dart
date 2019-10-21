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

  LoginBloc getLoginBloc(context) {
    return BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) => BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailState) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Login'),
                  content: Text('Login Fail ${state.message}'),
                );
              },
            );
          }
        },
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Image.asset('images/angular-logo.png'),
                  buildEmailField(),
                  buildPasswordField(),
                  buildLoginButton(context),
                  buildRegisterButton(context),
                  buildFacebookButton(context),
                  buildGoogleButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  RaisedButton buildGoogleButton(BuildContext context) {
    return RaisedButton(
      child: Text("Login with google"),
      onPressed: () {
        getLoginBloc(context).add(GoogleLoginEvent());
      },
    );
  }

  RaisedButton buildFacebookButton(BuildContext context) {
    return RaisedButton(
      child: Text("Login with facebook"),
      onPressed: () {
        getLoginBloc(context).add(FacebookLoginEvent());
      },
    );
  }

  FlatButton buildRegisterButton(BuildContext context) {
    return FlatButton(
      child: Text("Register new account"),
      onPressed: () {
        Navigator.of(context).pushNamed('/register');
      },
    );
  }

  RaisedButton buildLoginButton(BuildContext context) {
    return RaisedButton(
      child: Text("Login"),
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          getLoginBloc(context).add(
            LogingInEvent(email: email, password: password),
          );
        }
      },
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
