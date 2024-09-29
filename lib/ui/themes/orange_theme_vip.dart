import 'package:flutter/material.dart';
import 'package:lap_english/ui/colors/orange_color.dart';

class ThemeOrangeVip {
  /*  Sáng  */
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: LightOrangeColors.primaryColor,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
          fontSize: 24
      ),
    ),

    //CARD  -------------------------------------
    cardColor: LightOrangeColors.cardColor,

  );

  /*  Tối   */
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: DarkOrangeColors.primaryColor,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
          fontSize: 24
      ),
    ),

    //CARD  -------------------------------------
    cardColor: DarkOrangeColors.cardColor,

  );
}
