import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  static late final SharedPreferences _caching;

  //===   Khởi tạo  ===
  static Future<void> init() async {
    _caching = await SharedPreferences.getInstance();
  }

  Future<void> saveSettings(Setting setting, String data) async {
    _caching.setString(_getSettings(setting), data);
  }

  String? getSetting(Setting setting) => _caching.getString(_getSettings(setting));

  Future<void> saveStatus(StatusFlag flag, bool state) async => _caching.setBool(_getKeyStatus(flag), state);

  bool? getStatus(StatusFlag flag) => _caching.getBool(_getKeyStatus(flag));

  Future<void> clearCache(String key) async {
    await _caching.remove(key);
  }

  Future<void> clearAllCache() async {
    await _caching.clear();
  }

  String _getKeyStatus(StatusFlag flag) {
    return switch(flag) {
      StatusFlag.dataLoaded => 'dataLoaded',
      StatusFlag.dataNew => 'dataNew',
    };
  }

  String _getSettings(Setting setting) {
    return switch(setting) {
      Setting.theme => "theme",
      Setting.imageCover => "imageCover",
    };
  }
}

enum StatusFlag {
  dataLoaded,
  dataNew,
}

enum Setting {
  theme, imageCover
}