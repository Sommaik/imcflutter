import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imcflutter/register/bloc/bloc.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    RegisterBloc registerBloc = BlocProvider.of<RegisterBloc>(context);
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) => BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            Navigator.of(context).pop();
          } else if (state is RegisterFailState) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Register'),
                  content: Text('${state.message}'),
                );
              },
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Register'),
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  buildEmailField(),
                  buildPasswordField(),
                  RaisedButton(
                    child: Text("Register"),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        registerBloc.dispatch(
                          RegisteringEvent(
                            email: email,
                            password: password,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
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
    );
  }
}
