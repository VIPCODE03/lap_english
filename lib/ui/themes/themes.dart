
import 'package:flutter/material.dart';
import 'package:lap_english/constant/theme_constant.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/ui/themes/blue_theme_vip.dart';
import 'package:lap_english/ui/themes/green_theme_vip.dart';
import 'package:lap_english/ui/themes/orange_theme_vip.dart';
import 'package:lap_english/ui/themes/theme.dart';
import '../../utils/shared_preferences.dart';

class Themes with ChangeNotifier {
  ThemeVip _themeVip = ThemeVip(Assets.images.cover.cover1.path, ThemeConstant.blueTheme);

  themeProvider() {
    _loadTheme();
  }

  ThemeVip get themeVip => _themeVip;

  Future<void> _loadTheme() async {
    _themeVip.theme = await SharedPreferencesUtil.getString('color_theme') ?? '';
    _themeVip.imagePath = await SharedPreferencesUtil.getString('image_theme') ?? '';
    notifyListeners();
  }

  Future<void> updateTheme(ThemeVip themeVip) async {
    await SharedPreferencesUtil.saveString('color_theme', themeVip.theme);
    await SharedPreferencesUtil.saveString('image_theme', themeVip.imagePath);
    _themeVip = themeVip;
    notifyListeners();
  }

  static ThemeData lightTheme(String themeName) {
    switch(themeName) {
      case ThemeConstant.blueTheme: return ThemeBlueVip.light;
      case ThemeConstant.greenTheme: return ThemeGreenVip.light;
      case ThemeConstant.orangeTheme: return ThemeOrangeVip.light;
      default: return ThemeBlueVip.light;
    }
  }

  static ThemeData dartTheme(String themeName) {
    switch(themeName) {
      case ThemeConstant.blueTheme: return ThemeBlueVip.dark;
      case ThemeConstant.greenTheme: return ThemeGreenVip.dark;
      case ThemeConstant.orangeTheme: return ThemeOrangeVip.dark;
      default: return ThemeBlueVip.dark;
    }
  }

}