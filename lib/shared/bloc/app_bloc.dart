import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  SharedPreferences sharedPreferences;

  @override
  AppState get initialState => UnInitialAppState();

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is InitailAppEvent) {
      yield* _mapInitailApp();
    }
    if (event is AuthorizeAppEvent) {
      yield* _mapAuthorizeApp();
    }
    if (event is SignOutAppEvent) {
      yield* _mapLogOutApp();
    }
  }

  Stream<AppState> _mapInitailApp() async* {
    await Future.delayed(Duration(milliseconds: 2000));
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey('API_TOKEN')) {
      yield AuthorizedState();
    } else {
      yield UnAuthorizedState();
    }
  }

  Stream<AppState> _mapAuthorizeApp() async* {
    await Future.delayed(Duration(milliseconds: 2000));
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("API_TOKEN", 'DUMMY');
    yield AuthorizedState();
  }

  Stream<AppState> _mapLogOutApp() async* {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("API_TOKEN");
    yield UnAuthorizedState();
  }
}
