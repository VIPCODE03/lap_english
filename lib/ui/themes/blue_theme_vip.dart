import 'package:flutter/material.dart';
import 'package:lap_english/ui/colors/blue_color.dart';

class ThemeBlueVip {
  /*  Sáng  */
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: LightBlueColors.primaryColor,
    fontFamily: "MainFont",

    //CARD  -------------------------------------
    cardColor: LightBlueColors.cardColor,

  );

  /*  Tối   */
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: DarkBlueColors.primaryColor,
    fontFamily: "MainFont",

    //CARD  -------------------------------------
    cardColor: DarkBlueColors.cardColor,

  );
}
