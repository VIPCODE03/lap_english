import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/services/data_service.dart';
import 'package:lap_english/services/network_observer.dart';
import 'package:lap_english/ui/screens/main_screen.dart';
import 'package:lap_english/ui/widgets/other/loading.dart';

import '../../data/caching/cache_manager.dart';
import 'login_screen.dart';

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

  //===  Khởi tạo bộ nhớ và chuyển tới màn hình chính  ===
  Future<void> _navigateToMainScreen() async {
    await checkInternet();
    var cacheData = CacheManager();

    if(cacheData.getStatus(StatusFlag.dataLoaded) == null || cacheData.getStatus(StatusFlag.dataLoaded) == false) {
      DataService dataService = DataService();
      await dataService.loadDataServer();
      cacheData.saveStatus(StatusFlag.dataLoaded, true);
    }
    else {
      await Future.delayed(const Duration(milliseconds: 5900));
    }

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => cacheData.getToken().userId != -1
            ? const MainScreen()
            : const LoginScreen()
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
            image: Assets.images.logo.logoSplash.provider()
        ),
      )
    );
  }
}
