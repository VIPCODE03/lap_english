
import 'package:flutter/material.dart';

class ColorMix {
  static Color mixWhite(Color color) {
    return Color.alphaBlend(Colors.white38, color).withAlpha(66);
  }

}