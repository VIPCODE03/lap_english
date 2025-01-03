import 'package:flutter/material.dart';
import 'package:lap_english/services/network_observer.dart';
import 'package:lap_english/ui/screens/splash_screen.dart';
import 'package:lap_english/ui/themes/size.dart';
import 'package:lap_english/ui/themes/themes.dart';
import 'package:provider/provider.dart';
import 'data/caching/cache_manager.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheManager.init();

  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => Themes(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initConnectivity();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    updateScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Themes>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
            navigatorKey: navigatorKey,
            builder: (context, child) {
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                    textScaler: const TextScaler.linear(1.0),
                ),
                child: child!,
            );
          },
          debugShowCheckedModeBanner: false,
          theme: themeProvider.vipTheme.light,
          darkTheme: themeProvider.vipTheme.dark,
          themeMode: themeProvider.vipTheme.themeMode,
          home: const SplashScreen()
        );
      },
    );
  }
}