
import 'package:flutter/cupertino.dart';
import 'package:lap_english/ui/screens/home_screen.dart';
import 'package:lap_english/ui/screens/login_screen.dart';
import 'package:lap_english/ui/screens/splash_screen.dart';

class Screens {
  static const List<Widget> screens = [
    HomeScreen(),
    Center(child: Text('Profile Screen')),
    Center(child: Text('Settings Screen')),
  ];

  static const Map<String, Widget> screen = {
    "home" : HomeScreen(),
    "splash" : SplashScreen(),
    "login" : LoginScreen()
  };
}