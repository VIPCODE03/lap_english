import 'dart:ui';

abstract class VipColor {
  Color get primaryLight;
  Color get primaryDark;
}

class VipBlueColor extends VipColor {
  @override
  Color get primaryLight => const Color(0xFF0F64AA);

  @override
  Color get primaryDark => const Color(0xA81569CA);
}

class VipGreenColor extends VipColor {
  @override
  Color get primaryDark => const Color(0xA823DA10);

  @override
  Color get primaryLight => const Color(0xA848CC37);
}

class VipPuperBrownColor extends VipColor {
  @override
  Color get primaryDark => const Color(0xA8A11949);

  @override
  Color get primaryLight => const Color(0xA86E1031);
}

class VipOrangeColor extends VipColor {
  @override
  Color get primaryDark => const Color(0xB3B24B1F);

  @override
  Color get primaryLight => const Color(0xB3A4551D);
}

class VipTurquoiseColor extends VipColor {
  @override
  Color get primaryDark => const Color(0xB30F6C5D);

  @override
  Color get primaryLight => const Color(0xB3137D6D);

}