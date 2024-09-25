import 'package:flutter/material.dart';
import 'package:lap_english/ui/colors/GreenColor.dart';

class ThemeVip {
  /*  Sáng  */
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.lightGreen,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
          fontSize: 24
      ),
    ),

    //CARD  -------------------------------------
    cardColor: LightGreenColors.cardColor,

  );

  /*  Tối   */
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
          fontSize: 24
      ),
    ),

    //CARD  -------------------------------------
    cardColor: DarkGreenColors.cardColor,

  );
}
