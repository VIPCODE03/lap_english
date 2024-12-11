import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:lap_english/data/database/local/dao/user_dao.dart';
import 'package:lap_english/data/database/remote/service/data_service.dart';
import 'package:lap_english/data/model/auth/token.dart';
import 'package:lap_english/data/model/user/user.dart';
import 'package:dio/dio.dart';

class UserService extends ApiService<User> {
  final bool loggedIn;
  final UserDao userDao = UserDao();

  UserService({required this.loggedIn});

  Future<bool> login(User user) async {
    var postRequest = await request(
      api: '/auth/login-google',
      datas:
      {
        "email": user.email,
        "name": user.name,
        "json": jsonEncode(user.toJson())
      },
      requestType: RequestType.post
    );
    if(postRequest != null) {
      return true;
    }
    return false;
  }

  Future<bool> update(User user) async {
    var postRequest = await request(
        api: '/api/v1/user/${cacheManager.getToken().userId}',
        datas:
        {
          "json": jsonEncode(user.toJson())
        },
        requestType: RequestType.put
    );
    if(postRequest != null) {
      return true;
    }
    return false;
  }

  @override
  Future<User?> success200(Response response) async {
    try {
      Map<String, dynamic> mapData = response.data['data'];
      User user = User.fromJson(jsonDecode(mapData['json']));

      if(loggedIn) {
        userDao.update(user);
      }
      else {
        cacheManager.saveToken(MdlToken(
          mapData['accessToken'],
          mapData['refreshToken'],
          mapData['userId'],
        ));
        userDao.deleteAll();
        userDao.insert(user);
      }
      return user;
    } catch(e) {
      if (kDebugMode) {
        print('Error success200 user: $e');
      }
      return null;
    }
  }
}