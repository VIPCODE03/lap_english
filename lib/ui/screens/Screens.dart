
import 'package:flutter/cupertino.dart';
import 'package:lap_english/ui/screens/HomeScreen.dart';

class Screens {
  static final List<Widget> screens = [
    HomeScreen(),
    const Center(child: Text('Profile Screen')),
    const Center(child: Text('Settings Screen')),
  ];
}