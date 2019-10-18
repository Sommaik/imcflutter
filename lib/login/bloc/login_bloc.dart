import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:imcflutter/shared/bloc/bloc.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AppBloc appBloc;

  LoginBloc({@required this.appBloc});

  @override
  LoginState get initialState => LoginFormState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LogingInEvent) {
      yield* _mapLogingIn(event);
    }
  }

  Stream<LoginState> _mapLogingIn(LogingInEvent _event) async* {
    if ((_event.email == 'a@a.com') && (_event.password == '12345678')) {
      this.appBloc.dispatch(AuthorizeAppEvent());
      yield LoginSuccessState();
    } else {
      yield LoginFailState();
    }
  }
}
