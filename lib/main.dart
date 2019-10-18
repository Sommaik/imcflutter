import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imcflutter/appintro/ui/app_intro_page.dart';
import 'package:imcflutter/counter/bloc/bloc.dart';
import 'package:imcflutter/counter/ui/ui.dart';
import 'package:imcflutter/home/ui/home_page.dart';
import 'package:imcflutter/login/bloc/login_bloc.dart';
import 'package:imcflutter/login/ui/login_page.dart';
import 'package:imcflutter/register/ui/register_page.dart';
import 'package:imcflutter/shared/bloc/bloc.dart';
import 'package:imcflutter/shared/my_bloc_delegate.dart';

void main() {
  BlocSupervisor.delegate = MyBlocDelegate();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          builder: (context) => AppBloc()
            ..dispatch(
              InitailAppEvent(),
            ),
        )
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state is UnAuthorizedState) {
            return UnAuthorizeApp();
          } else if (state is AuthorizedState) {
            return MyApp();
          } else {
            return LoadingApp();
          }
        },
      ),
    ),
  );
}

class LoadingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class UnAuthorizeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AppIntroPage(),
        '/login': (context) => BlocProvider<LoginBloc>(
              builder: (context) => LoginBloc(appBloc: appBloc),
              child: LoginPage(),
            ),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/counter': (context) => MyCounterPage()
        },
      ),
    );
  }
}
