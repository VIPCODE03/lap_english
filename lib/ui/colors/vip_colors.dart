
import 'dart:math';

import 'package:flutter/material.dart';

class VipColors {
  static Color getRandomColor(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    Random random = Random();
    int r = random.nextInt(151) + 50;
    int g = random.nextInt(151) + 50;
    int b = random.nextInt(151) + 50;
    var color = Color.alphaBlend(
        brightness == Brightness.light
            ? Colors.white12
            : Colors.black12,
        Color.fromRGBO(r, g, b, 1)
    );
    return color;
  }
}