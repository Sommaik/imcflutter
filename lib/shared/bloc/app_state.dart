import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  const AppState();
}

class UnInitialAppState extends AppState {
  @override
  List<Object> get props => [];
}

class UnAuthorizedState extends AppState {
  @override
  List<Object> get props => [];
}

class AuthorizedState extends AppState {
  @override
  List<Object> get props => [];
}
