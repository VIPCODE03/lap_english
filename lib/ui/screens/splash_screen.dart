import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/ui/screens/main_screen.dart';

import '../../data/caching/cache_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMainScreen();
  }

  //=== Khởi tạo bộ nhớ và chuyển tới màn hình chính  ===
  Future<void> _navigateToMainScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    await CacheManager.init();

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return const MainScreen();
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 250,
          child: Image(image: Assets.images.icon.loading.provider())
          ),
        ),
    );
  }
}
