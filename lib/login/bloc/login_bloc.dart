import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
    if (event is FacebookLoginEvent) {
      yield* _mapFacebookLogin();
    }
    if (event is GoogleLoginEvent) {
      yield* _mapGoogleLogin();
    }
  }

  Stream<LoginState> _mapGoogleLogin() async* {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn();
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
      yield LoginSuccessState();
      this.appBloc.add(AuthorizeAppEvent());
    } catch (e) {
      print(e);
      yield LoginFailState(message: e);
      yield LoginFormState();
    }
  }

  Stream<LoginState> _mapFacebookLogin() async* {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final FacebookLogin facebookLogin = FacebookLogin();
      final result = await facebookLogin.logIn(['email']);
      final _fb = FacebookAuthProvider.getCredential(
          accessToken: result.accessToken.token);
      await _auth.signInWithCredential(_fb);
      yield LoginSuccessState();
      this.appBloc.add(AuthorizeAppEvent());
    } catch (e) {
      yield LoginFailState(message: e);
      yield LoginFormState();
    }
  }

  Stream<LoginState> _mapLogingIn(LogingInEvent _event) async* {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      await _auth.signInWithEmailAndPassword(
          email: _event.email, password: _event.password);
      yield LoginSuccessState();
      this.appBloc.add(AuthorizeAppEvent());
    } catch (e) {
      yield LoginFailState(message: e);
      yield LoginFormState();
    }
  }

  // Stream<LoginState> _mapLogingIn(LogingInEvent _event) async* {
  //   if ((_event.email == 'a@a.com') && (_event.password == '12345678')) {
  //     this.appBloc.add(AuthorizeAppEvent());
  //     yield LoginSuccessState();
  //   } else {
  //     yield LoginFailState();
  //     yield LoginFormState();
  //   }
  // }
}
