import 'package:flutter/cupertino.dart';

void updateScreen(BuildContext context) {
  lightMode = MediaQuery.of(context).platformBrightness == Brightness.light;
  orientation = MediaQuery.of(context).orientation;
  isPortrait = orientation == Orientation.portrait;
  maxHeight = MediaQuery.of(context).size.height;
  maxWidth = MediaQuery.of(context).size.width;
  isTablet = MediaQuery.of(context).size.shortestSide > 600;
  hasChanged.value = !hasChanged.value;
  textSize = TextSize(
    specical: ((isTablet || !isPortrait) ? maxWidth / 50 : maxHeight / 50) * scale,
  );
}

late bool lightMode;

late Orientation orientation;

late bool isPortrait;

late double maxHeight;

late double maxWidth;

ValueNotifier<bool> hasChanged = ValueNotifier(false);

bool isTablet = false;

late TextSize textSize;

double scale = 1.15;

class TextSize {
  double normal = 12 * scale;
  double medium = 16 * scale;
  double title = 20 * scale;
  double specical;

  TextSize({
    required this.specical
  });
}