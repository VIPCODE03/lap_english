import 'package:flutter/material.dart';
import 'package:lap_english/constant/theme_constant.dart';
import 'package:lap_english/data/caching/cache_manager.dart';
import 'package:lap_english/ui/themes/theme.dart';

class Themes with ChangeNotifier {
  final CacheManager caching = CacheManager();
  VipTheme _vipTheme = ThemeConstant.themes[0];

  Themes() {
    _init();
  }

  VipTheme get vipTheme => _vipTheme;

  //===   Lấy theme từ bộ nhớ   ===
  Future<void> _init() async {
    int indexTheme = caching.getTheme() ?? 0;
    _vipTheme = ThemeConstant.themes[indexTheme];
    _vipTheme.themeMode = caching.getThemeMode();
    notifyListeners();
  }

  //===   Cập nhật theme và lưu vào bộ nhớ  ===
  Future<void> updateTheme(int indexTheme) async {
    _vipTheme = ThemeConstant.themes[indexTheme];
    _vipTheme.themeMode = caching.getThemeMode();
    await caching.saveTheme(indexTheme);
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    _vipTheme.themeMode = themeMode;
    await caching.saveThemeMode(themeMode);
    notifyListeners();
  }
}
