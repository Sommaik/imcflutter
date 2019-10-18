import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
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
  }

  Stream<AppState> _mapInitailApp() async* {
    await Future.delayed(Duration(milliseconds: 2000));
    yield UnAuthorizedState();
  }

  Stream<AppState> _mapAuthorizeApp() async* {
    await Future.delayed(Duration(milliseconds: 2000));
    yield AuthorizedState();
  }
}
