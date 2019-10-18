import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class InitialLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginFormState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccessState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginFailState extends LoginState {
  @override
  List<Object> get props => [];
}
