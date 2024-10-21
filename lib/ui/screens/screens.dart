
import 'package:flutter/cupertino.dart';
import 'package:lap_english/ui/screens/home_screen.dart';
import 'package:lap_english/ui/screens/profile_screen.dart';

class Screens {
  static const List<Widget> screens = [
    HomeScreen(),
    ProfileScreen(),
    Center(child: Text('Settings Screen')),
  ];
}