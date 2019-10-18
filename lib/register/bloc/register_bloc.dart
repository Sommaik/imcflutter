import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  @override
  RegisterState get initialState => RegisterFormState();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisteringEvent) {
      yield* _mapRegistering(event);
    }
  }

  Stream<RegisterState> _mapRegistering(RegisteringEvent event) async* {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth.createUserWithEmailAndPassword(
          email: event.email, password: event.password);
      yield RegisterSuccessState();
    } catch (e) {
      yield RegisterFailState(message: e);
    }
  }
}
