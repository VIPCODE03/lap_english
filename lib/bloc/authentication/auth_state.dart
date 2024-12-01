import 'package:lap_english/data/model/user/user.dart';

class AuthState {}

class PendingLoginState extends AuthState {}

class LoadingLoginState extends AuthState {}

class LoadedLoginState extends AuthState {
  final List<User> users;

  LoadedLoginState(this.users);
}

class ErrorLoginState extends AuthState {
  final String message;

  ErrorLoginState(this.message);
}
