import 'package:flutter/material.dart';
import 'package:lap_english/ui/colors/blue_color.dart';

class ThemeBlueVip {
  /*  Sáng  */
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: LightBlueColors.primaryColor,
    fontFamily: "MainFont",
    textTheme: const TextTheme(
        titleLarge: TextStyle(color: LightBlueColors.textColor)
    ),

    //CARD  -------------------------------------
    cardColor: LightBlueColors.cardColor,

  );

  /*  Tối   */
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: DarkBlueColors.primaryColor,
    fontFamily: "MainFont",
    textTheme: const TextTheme(
        titleLarge: TextStyle(color: DarkBlueColors.textColor)
    ),

    //CARD  -------------------------------------
    cardColor: DarkBlueColors.cardColor,

  );
}
