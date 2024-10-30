
import 'package:flutter/cupertino.dart';
import 'package:lap_english/ui/screens/nav_screens/home_screen.dart';
import 'package:lap_english/ui/screens/nav_screens/profile_screen.dart';
import 'package:lap_english/ui/screens/nav_screens/task_screen.dart';

class Screens {
  static const List<Widget> screens = [
    HomeScreen(),
    ProfileScreen(),
    TaskScreen(),
    Center(child: Text('Settings Screen')),
  ];
}