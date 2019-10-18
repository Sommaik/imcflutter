import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterFormState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterSuccessState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterFailState extends RegisterState {
  final String message;

  RegisterFailState({@required this.message});
  @override
  List<Object> get props => [message];
}
