
import 'package:lap_english/ui/themes/theme.dart';
import '../../../gen/assets.gen.dart';

class ThemeConstant {
  static const String blueTheme = "blueTheme";
  static const String greenTheme = "greenTheme";
  static const String orangeTheme = "orangeTheme";

  static final ThemeVip theme1 = ThemeVip(Assets.images.cover.cover5.path, orangeTheme);
  static final ThemeVip theme2 = ThemeVip(Assets.images.cover.cover4.path, blueTheme);
  static final ThemeVip theme3 = ThemeVip(Assets.images.cover.cover3.path, orangeTheme);
  static final ThemeVip theme4 = ThemeVip(Assets.images.cover.cover2.path, greenTheme);
  static final ThemeVip theme5 = ThemeVip(Assets.images.cover.cover1.path, blueTheme);
  static final ThemeVip theme6 = ThemeVip(Assets.images.cover.cover6.path, greenTheme);
  static final ThemeVip theme7 = ThemeVip(Assets.images.cover.cover7.path, orangeTheme);

  static final List<ThemeVip> themes = [
    theme1, theme2, theme3, theme4, theme5, theme6, theme7
  ];
}