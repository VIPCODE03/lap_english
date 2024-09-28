
import 'package:flutter/cupertino.dart';
import 'package:lap_english/ui/screens/HomeScreen.dart';

class Screens {
  static const List<Widget> screens = [
    HomeScreen(),
    Center(child: Text('Profile Screen')),
    Center(child: Text('Settings Screen')),
  ];

  static const Map<String, Widget> screen = {
    "home" : HomeScreen(),
  };
}