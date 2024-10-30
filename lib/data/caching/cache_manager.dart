import 'package:flutter/foundation.dart';
import 'package:lap_english/data/model/learn/sentence.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';
import 'package:lap_english/data/model/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CacheManager {
  static late final SharedPreferences _caching;

  //===   Khởi tạo  ===
  static Future<void> init() async {
    _caching = await SharedPreferences.getInstance();
  }

//===   Lưu dữ liệu vào bộ nhớ đệm  ===
  Future<void> save(String key, List<Object> datas) async {
    try {
      List<Map<String, dynamic>> jsonList = datas.map((dataJson) {
        if (key == CacheKeys.user) {
          return (dataJson as User).toJson();
        }
        else if (key == CacheKeys.mainSentenceTopic) {
          return (dataJson as MainSentenceTopic).toJson();
        }
        else if(key == CacheKeys.mainVocabularyTopic) {
          return (dataJson as MainVocabularyTopic).toJson();
        }
        else {
          throw Exception('Unsupported key');
        }
      }).toList();
      await _caching.setString(key, jsonEncode(jsonList));

    } catch(e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  //===   Lấy dữ liệu từ bộ nhớ đệm   ===
  List<dynamic>? get(String key) {
    final dataJson = _caching.getString(key);
    return dataJson != null ? jsonDecode(dataJson) : null;
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
  static const String mainSentenceTopic = "mainSentenceTopic";
  static const String mainVocabularyTopic = "mainVocabularyTopic";
}