import 'package:flutter/material.dart';
import 'package:lap_english/data/caching/cache_manager.dart';
import 'package:lap_english/ui/themes/size.dart';
import 'package:lap_english/ui/widgets/nav/setting_widgets/group_app.dart';
import 'package:lap_english/ui/widgets/nav/setting_widgets/group_display.dart';
import 'package:lap_english/ui/widgets/nav/setting_widgets/group_support.dart';
import 'package:lap_english/ui/widgets/other/scaffold.dart';

class NavSettings extends StatefulWidget {
  const NavSettings({super.key});

  @override
  State<StatefulWidget> createState() => _NavSettingsState();

}

class _NavSettingsState extends State<NavSettings> {
  CacheManager cacheManager = CacheManager();

  @override
  void initState() {
    super.initState();
    hasChanged.addListener(updateScreen);
  }

  @override
  void dispose() {
    super.dispose();
    hasChanged.removeListener(updateScreen);
  }

  void updateScreen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WdgScaffold(
        body: Padding(
          padding: MediaQuery.paddingOf(context),
          child: ListView(
              children: [
                WdgDisplaySettings(cacheManager: cacheManager),

                WdgGroupSupport(cacheManager: cacheManager),

                WdgGroupApp(cacheManager: cacheManager),
              ],
            ),
        )
    );
  }
}