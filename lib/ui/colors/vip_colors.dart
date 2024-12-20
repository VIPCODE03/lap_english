import 'dart:math';
import 'package:flutter/material.dart';

import '../themes/size.dart';

class VipColors {
  static Color getRandomColor(BuildContext context, int alpha) {
    Random random = Random();
    int r = random.nextInt(151) + 50;
    int g = random.nextInt(151) + 50;
    int b = random.nextInt(151) + 50;
    if (lightMode) {
      return Color.alphaBlend(Colors.white.withAlpha(alpha), Color.fromRGBO(r, g, b, 1));
    } else {
      return Color.alphaBlend(Colors.black.withAlpha(alpha), Color.fromRGBO(r, g, b, 1));
    }
  }

  static Color onPrimary(BuildContext context) {
    return Color.alphaBlend(primary(context).withAlpha(lightMode ? 100 : 66), Colors.grey.withAlpha(50));
  }

  static Color primary(BuildContext context) {
    return Theme.of(context).primaryColor;
  }

  static Color text(BuildContext context) {
    return Color.alphaBlend(primary(context).withAlpha(lightMode ? 88 : 66), Colors.grey);
  }
}