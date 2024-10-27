import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/caching/cache_manager.dart';
import 'package:lap_english/data/model/user/user.dart';

import '../../a_data_test/data_user_test.dart';

/*  Sự kiện */
abstract class UserEvent {}

class UserEventLoad extends UserEvent {}

class UserEventUpdate extends UserEvent {}

/*  Trạng thái  */
class UserState {}

class UserStateInitial extends UserState {}

class UserStateInitialized extends UserState {
  var cacheManager = CacheManager();
  final User user;

  UserStateInitialized({required this.user});

  UserStateInitialized update({User? newUser}) {
    cacheManager.save(user);
    return UserStateInitialized(user: newUser ?? user);
  }
}

/*  Bloc  */
class UserBloc extends Bloc<UserEvent, UserState> {
  var cacheManager = CacheManager();

  UserBloc() : super(UserStateInitial()) {

    //---   Load user   ---
    on<UserEventLoad>((event, emit) {
      //--- Kiểm tra dữ liệu trong bộ nhớ đệm   ---
      final User user;
      final cacheUser = cacheManager.get(CacheKeys.user);
      if(cacheUser != null) {
        user = User.fromJson(cacheUser);
      }
      else {
        final userMap = jsonDecode(UserDataTest.getUserJson());
        user = User.fromJson(userMap);
        cacheManager.save(user);
      }
      emit(UserStateInitialized(user: user));
    });

    //---   Cập nhật user   ---
    on<UserEventUpdate>((event, emit) {
      if (state is UserStateInitialized) {
        final currentState = state as UserStateInitialized;
        emit(currentState.update());
      }
    });
  }
}