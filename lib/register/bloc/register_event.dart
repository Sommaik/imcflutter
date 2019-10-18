import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisteringEvent extends RegisterEvent {
  final String email;
  final String password;

  RegisteringEvent({@required this.email, @required this.password});

  @override
  List<Object> get props => null;
}
