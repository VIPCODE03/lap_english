import 'package:flutter/material.dart';
import 'package:lap_english/ui/screens/splash_screen.dart';
import 'package:lap_english/ui/themes/themes.dart';
import 'package:provider/provider.dart';
import 'data/caching/cache_manager.dart';

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
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    lightMode = MediaQuery.of(context).platformBrightness == Brightness.light;
    orientation = MediaQuery.of(context).orientation;
    maxHeight = MediaQuery.of(context).size.height;
    maxWidth = MediaQuery.of(context).size.width;
    if(MediaQuery.of(context).size.shortestSide > 600) isTablet = true;
    hasChanged.value = !hasChanged.value;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Themes>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.vipTheme.light,
          darkTheme: themeProvider.vipTheme.dark,
          themeMode: ThemeMode.system,
          home: const SplashScreen(),
        );
      },
    );
  }
}

late bool lightMode;

late Orientation orientation;

late double maxHeight;

late double maxWidth;

ValueNotifier<bool> hasChanged = ValueNotifier(false);

bool isTablet = false;