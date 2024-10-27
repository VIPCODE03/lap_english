import 'package:lap_english/data/model/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../model/task/roll_call.dart';

class CacheManager {
  static late final SharedPreferences _caching;

  //===   Khởi tạo  ===
  static Future<void> init() async {
    _caching = await SharedPreferences.getInstance();
  }

  //===   Lưu dữ liệu vào bộ nhớ đệm  ===
  Future<void> save(Object data) async {
    if(data is User) {
      await _caching.setString(CacheKeys.user, jsonEncode(data.toJson()));
    }

    if(data is RollCall) {
      await _caching.setString(CacheKeys.rollCall, jsonEncode(data.toJson()));
    }
  }

  //===   Lấy dữ liệu từ bộ nhớ đệm   ===
  Map<String, dynamic>? get(String key) {
    final userJson = _caching.getString(key);
    return userJson != null ? jsonDecode(userJson) : null;
  }

  Future<void> clearCache(String key) async {
    await _caching.remove(key);
  }

  Future<void> clearAllCache() async {
    await _caching.clear();
  }
}

class CacheKeys {
  static const String user = "user";
  static const String rollCall = "rollCall";
}