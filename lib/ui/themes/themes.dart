
import 'package:flutter/material.dart';
import 'package:lap_english/constant/theme_constant.dart';
import 'package:lap_english/data/caching/cache_manager.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/ui/themes/blue_theme_vip.dart';
import 'package:lap_english/ui/themes/green_theme_vip.dart';
import 'package:lap_english/ui/themes/orange_theme_vip.dart';
import 'package:lap_english/ui/themes/theme.dart';

class Themes with ChangeNotifier {
  final caching = CacheManager();
  ThemeVip _themeVip = ThemeVip(Assets.images.cover.cover1.path, ThemeConstant.blueTheme);

  Themes() {
    _loadTheme();
  }

  ThemeVip get themeVip => _themeVip;

  //---   Lấy theme từ bộ nhớ  ---
  Future<void> _loadTheme() async {
    _themeVip.theme = caching.getSetting(Setting.theme) ?? _themeVip.theme;
    _themeVip.imagePath = caching.getSetting(Setting.imageCover) ?? _themeVip.imagePath;
    notifyListeners();
  }

  //---   Cập nhật theme vào bộ nhớ  ---
  Future<void> updateTheme(ThemeVip themeVip) async {
    caching.saveSettings(Setting.theme, themeVip.theme);
    caching.saveSettings(Setting.imageCover, themeVip.imagePath);
    _themeVip = themeVip;
    notifyListeners();
  }

  //---   Lấy theme sáng  ---
  static ThemeData lightTheme(String themeName) {
    switch(themeName) {
      case ThemeConstant.blueTheme: return ThemeBlueVip.light;
      case ThemeConstant.greenTheme: return ThemeGreenVip.light;
      case ThemeConstant.orangeTheme: return ThemeOrangeVip.light;
      default: return ThemeBlueVip.light;
    }
  }

  //---   Lấy theme tối  ---
  static ThemeData dartTheme(String themeName) {
    switch(themeName) {
      case ThemeConstant.blueTheme: return ThemeBlueVip.dark;
      case ThemeConstant.greenTheme: return ThemeGreenVip.dark;
      case ThemeConstant.orangeTheme: return ThemeOrangeVip.dark;
      default: return ThemeBlueVip.dark;
    }
  }

}