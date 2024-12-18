import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:lap_english/data/database/local/dao/user_dao.dart';
import 'package:lap_english/data/database/remote/service/data_service.dart';
import 'package:lap_english/data/model/auth/token.dart';
import 'package:lap_english/data/model/user/user.dart';
import 'package:dio/dio.dart';

class UserService extends ApiService {
  late _TypeUserRequest _type;
  final UserDao userDao = UserDao();

  UserService();

  Future<bool> login(User user) async {
    print(user.avatar);
    _type = _TypeUserRequest.login;
    var postRequest = await request(
      api: '/auth/login-google',
      datas:
      {
        "email": user.email,
        "name": user.name,
        "avatar": user.avatar,
      },
      requestType: RequestType.post
    );
    if(postRequest != null) {
      return true;
    }
    return false;
  }

  Future<bool> update(User user) async {
    _type = _TypeUserRequest.update;
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

  Future<User?> fetch() async {
    _type = _TypeUserRequest.fetch;
    return await request(
        api: '/api/v1/user',
        requestType: RequestType.get
    );
  }

  @override
  Future<dynamic> success200(Response response) async {
    try {
      switch(_type) {
        case _TypeUserRequest.login:
          Map<String, dynamic> mapData = response.data['data'];
          cacheManager.saveToken(MdlToken(
            mapData['accessToken'],
            mapData['refreshToken'],
            mapData['userId'],
          ));
          return true;

        case _TypeUserRequest.update:
          return User.fromJson(response.data['data']);

        case _TypeUserRequest.fetch:
          return User.fromJson(response.data['data']);
      }

    } catch(e) {
      if (kDebugMode) {
        print('Error success200 UserService: $e');
        print(response.data['data']);
      }
      return null;
    }
  }
}

enum _TypeUserRequest {
  login, update, fetch
}