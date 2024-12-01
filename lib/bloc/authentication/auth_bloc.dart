import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lap_english/bloc/authentication/auth_event.dart';
import 'package:lap_english/bloc/authentication/auth_state.dart';
import 'package:lap_english/data/database/local/dao/user_dao.dart';
import 'package:lap_english/data/model/user/skill.dart';
import 'package:lap_english/data/model/user/user.dart';

import '../../data/model/user/cumulative_point.dart';

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

  Future<void> _init(Emitter<AuthState> emit) async {
    emit(LoadingLoginState());
    List<User> users = await _userDao.getData();
    if (users.isEmpty) {
      emit(PendingLoginState());
    } else {
      emit(LoadedLoginState(users));
    }
  }

  Future<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoadingLoginState());
    try {
      GoogleSignInAccount? userAuthGoogle = event.user;
      if (userAuthGoogle == null) {
        emit(PendingLoginState());
        return;
      }
      User user = User(
          name: userAuthGoogle.displayName!,
          email: userAuthGoogle.email,
          skills: Skill(0, 0, 0, 0),
          titles: [],
          dailyTasks: [],
          cumulativePoint: CumulativePoint(0, 0, 0));
      await _userDao.deleteAll();
      bool result = await _userDao.insert(user);
      if (result) {
        emit(LoadedLoginState([user]));
        return;
      }
      emit(PendingLoginState());

      // User user = await _authenticationService.loginWithGoogle(event.user);
      // emit(LoadedLoginState(user));
    } catch (e) {
      emit(ErrorLoginState(e.toString()));
      return;
    }
  }
}
