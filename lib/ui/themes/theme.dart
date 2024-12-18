import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/vip_color.dart';

class VipTheme {
  String imagePath;
  VipColor color;
  ThemeMode themeMode = ThemeMode.system;

  VipTheme({
    required this.imagePath,
    required this.color
  });

  ThemeData get light => ThemeData(
    brightness: Brightness.light,
    primaryColor: color.primaryLight,
    textTheme: GoogleFonts.pangolinTextTheme(
      ThemeData.light().textTheme,
    ),
  );

  ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    primaryColor: color.primaryDark,
    textTheme: GoogleFonts.pangolinTextTheme(
      ThemeData.dark().textTheme,
    ),
  );
}
