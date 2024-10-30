import 'package:flutter/material.dart';
import 'package:lap_english/ui/screens/splash_screen.dart';
import 'package:lap_english/ui/themes/themes.dart';
import 'package:provider/provider.dart';

import 'data/caching/cache_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheManager.init(); //-> Khởi tạo quản lý bộ nhớ đệm
  runApp(
      ChangeNotifierProvider(
        create: (BuildContext context) => Themes(),
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Themes>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Themes.lightTheme(themeProvider.themeVip.theme),
          darkTheme: Themes.dartTheme(themeProvider.themeVip.theme),
          themeMode: ThemeMode.system,
          home: const SplashScreen(),
        );
      },
    );
  }
}
