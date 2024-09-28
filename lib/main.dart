import 'package:flutter/material.dart';
import 'package:lap_english/ui/screens/SplashScreen.dart';
import 'package:lap_english/ui/themes/ThemeVip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeVip.light,  //->  Light theme
      darkTheme: ThemeVip.dark,  //-> Dark theme
      themeMode: ThemeMode.system,  //->  Áp dụng theo hệ thống
      home: const SplashScreen()
    );
  }
}
