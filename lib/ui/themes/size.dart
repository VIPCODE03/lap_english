import 'package:flutter/cupertino.dart';

import '../../data/caching/cache_manager.dart';

void updateScreen(BuildContext context) {
  lightMode = MediaQuery.of(context).platformBrightness == Brightness.light;
  orientation = MediaQuery.of(context).orientation;
  isPortrait = orientation == Orientation.portrait;
  maxHeight = MediaQuery.of(context).size.height;
  maxWidth = MediaQuery.of(context).size.width;
  isTablet = MediaQuery.of(context).size.shortestSide > 600;
  hasChanged.value = !hasChanged.value;
  textSize = TextSize(CacheManager().getScale());
}

late bool lightMode;

late Orientation orientation;

late bool isPortrait;

late double maxHeight;

late double maxWidth;

ValueNotifier<bool> hasChanged = ValueNotifier(false);

bool isTablet = false;

TextSize textSize = TextSize(CacheManager().getScale());

class TextSize {
  double _normal = 0;
  double _medium = 0;
  double _title = 0;
  double _special = 0;

  TextSize(double scale) {
    update(scale);
  }

  void update(double scale) {
    _normal = 14 * scale - ((isTablet || isPortrait) ? 0.03 : 0.09) * 14 ;
    _medium = 18 * scale - ((isTablet || isPortrait) ? 0.03 : 0.09) * 18;
    _title = 20 * scale - ((isTablet || isPortrait) ? 0.03 : 0.09) * 20;
    _special = ((isTablet || !isPortrait)
        ? maxWidth / 66 + (1.5 * maxHeight) / maxWidth
        : maxHeight / 60 + (4 * maxWidth) / maxHeight
    ) * scale;
  }

  double get normal => _normal;
  double get medium => _medium;
  double get title => _title;
  double get special => _special;
}
