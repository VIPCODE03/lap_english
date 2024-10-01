import 'package:flutter/material.dart';
import 'package:lap_english/ui/colors/green_color.dart';

class ThemeGreenVip {
  /*  Sáng  */
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: LightGreenColors.primaryColor,
    fontFamily: "MainFont",

    //CARD  -------------------------------------
    cardColor: LightGreenColors.cardColor,

  );

  /*  Tối   */
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: DarkGreenColors.primaryColor,
    fontFamily: "MainFont",

    //CARD  -------------------------------------
    cardColor: DarkGreenColors.cardColor,

  );
}
