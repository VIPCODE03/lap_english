
import 'package:flutter/material.dart';
import 'package:lap_english/constant/theme_constant.dart';
import 'package:lap_english/data/caching/cache_manager.dart';
import 'package:lap_english/ui/themes/theme.dart';

class Themes with ChangeNotifier {
  final caching = CacheManager();
  VipTheme _vipTheme = ThemeConstant.themes[0];

  Themes() {
    _loadTheme();
  }

  VipTheme get vipTheme => _vipTheme;

  //---   Lấy theme từ bộ nhớ  ---
  Future<void> _loadTheme() async {
    int indexTheme = caching.getTheme() ?? 0;
    _vipTheme = ThemeConstant.themes[indexTheme];
    notifyListeners();
  }

  //---   Cập nhật theme vào bộ nhớ  ---
  Future<void> updateTheme(int indexTheme) async {
    _vipTheme = ThemeConstant.themes[indexTheme];
    await caching.saveTheme(indexTheme);
    notifyListeners();
  }
}