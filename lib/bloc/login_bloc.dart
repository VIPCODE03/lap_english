import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lap_english/data/database/remote/service/user_service.dart';
import 'package:lap_english/data/model/user/accumulate.dart';
import 'package:lap_english/data/model/user/skill.dart';
import 'package:lap_english/data/model/user/user.dart';

import '../../data/model/user/cumulative_point.dart';

/*  Sự kiện */
abstract class AuthEvent {}

class InitAuthEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  GoogleSignInAccount? accountGG;
  User? user;

  LoginEvent(this.accountGG, this.user);
}

/*  Trạng thái  */
class AuthState {}

class PendingLoginState extends AuthState {}

class LoadingLoginState extends AuthState {}

class LoadedLoginState extends AuthState {
  LoadedLoginState();
}

class ErrorLoginState extends AuthState {
  final String message;

  ErrorLoginState(this.message);
}

/*  Bloc  */
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {

    on<InitAuthEvent>((event, emit) async {
      await _init(emit);
    });

    on<LoginEvent>((event, emit) async {
      await _login(event, emit);
    });

    add(InitAuthEvent());
  }

  //=== Sự kiện khởi tạo  ===
  Future<void> _init(Emitter<AuthState> emit) async {
    emit(PendingLoginState());
  }

  //=== Sự kiện login ===
  Future<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoadingLoginState());
    try {
      User? userCache = event.user;
      GoogleSignInAccount? userAuthGoogle = event.accountGG;

      bool login = false;

      if(userCache != null) {
        login = (await UserService().fetch()) == null;
        if(!login) {
          emit(LoadedLoginState());
          return;
        }
      }

      else {
        if (userAuthGoogle == null) {
          emit(ErrorLoginState('Lỗi đăng nhập'));
          return;
        }

        User user = User(
            avatar: userAuthGoogle.photoUrl ?? 'ava',
            name: userAuthGoogle.displayName!,
            email: userAuthGoogle.email,
            skills: Skills(1, 1, 1, 1),
            titles: [],
            dailyTasks: [],
            cumulativePoint: CumulativePoint(0, Random().nextInt(100), 0),
            accumulate: MdlAccumulate(0, 0, 0, 1)
        );

        login = await UserService().login(user);
      }

      if (login) {
        emit(LoadedLoginState());
        return;
      }

      emit(ErrorLoginState('Đăng nhập thất bại'));

    } catch (e) {
      emit(ErrorLoginState(e.toString()));
      return;
    }
  }
}
