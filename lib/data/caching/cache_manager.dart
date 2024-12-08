import 'package:shared_preferences/shared_preferences.dart';

import '../model/auth/token.dart';

class CacheManager {
  static late final SharedPreferences _caching;

  //===   Khởi tạo  ===
  static Future<void> init() async {
    _caching = await SharedPreferences.getInstance();
  }

  Future<void> saveToken(MdlToken token) async {
    _caching.setString('accessToken', token.accessToken);
    _caching.setString('refreshToken', token.refreshToken);
  }

  MdlToken getToken() {
    return MdlToken(_caching.getString('accessToken') ?? '', _caching.getString('refreshToken') ?? '');
  }

  Future<void> saveTheme(int indexTheme) async {
    _caching.setInt("theme", indexTheme);
  }

  int? getTheme() {
    return _caching.getInt("theme");
  }

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

}

enum StatusFlag {
  dataLoaded,
  dataNew,
}
