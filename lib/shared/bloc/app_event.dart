import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class InitailAppEvent extends AppEvent {
  @override
  List<Object> get props => [];
}

class AuthorizeAppEvent extends AppEvent {
  @override
  List<Object> get props => [];
}

class SignOutAppEvent extends AppEvent {
  @override
  List<Object> get props => [];
}
