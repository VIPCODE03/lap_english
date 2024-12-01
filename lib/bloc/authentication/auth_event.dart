import 'package:google_sign_in/google_sign_in.dart';

class AuthEvent {}

class InitAuthEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  GoogleSignInAccount? user;

  LoginEvent(this.user);
}
