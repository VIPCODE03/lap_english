import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lap_english/data/database/local/dao/user_dao.dart';
import 'package:lap_english/data/database/remote/service/user_service.dart';
import 'package:lap_english/data/model/task_and_reward/daily_task.dart';
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

class LoginState extends AuthState {
  final User user;

  LoginState(this.user);
}

class ErrorLoginState extends AuthState {
  final String message;

  ErrorLoginState(this.message);
}

/*  Bloc  */
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserDao _userDao = UserDao();

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
    emit(LoadingLoginState());
    var users = await _userDao.getData();
    if (users.isEmpty) {
      emit(PendingLoginState());
    } else {
      add(LoginEvent(null, users.first));
    }
  }

  //=== Sự kiện login ===
  Future<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoadingLoginState());
    try {
      User? userCache = event.user;
      GoogleSignInAccount? userAuthGoogle = event.accountGG;

      bool login = false;

      if(userCache != null) {
        login = await UserService(loggedIn: true).login(userCache);
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
            avatar: userAuthGoogle.photoUrl,
            name: userAuthGoogle.displayName!,
            email: userAuthGoogle.email,
            skills: Skill(1, 1, 1, 1),
            titles: [],
            dailyTasks: MdlDailyTask.create(),
            cumulativePoint: CumulativePoint(0, Random().nextInt(100), 0),
            accumulate: MdlAccumulate(0, 0, 0, 1)
        );

        login = await UserService(loggedIn: false).login(user);
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
