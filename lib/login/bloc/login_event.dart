import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LogingInEvent extends LoginEvent {
  final String email;
  final String password;

  LogingInEvent({this.email, this.password});

  @override
  List<Object> get props => [email, password];

  @override
  String toString() {
    return '[LogingInEvent] email:$email, password:$password';
  }
}
