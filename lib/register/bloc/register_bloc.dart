import 'dart:async';
import 'package:bloc/bloc.dart';
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
    yield RegisterSuccessState();
  }
}
