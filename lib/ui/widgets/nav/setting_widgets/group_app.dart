import 'package:flutter/material.dart';
import 'package:lap_english/data/caching/cache_manager.dart';
import 'package:lap_english/ui/widgets/nav/setting_widgets/item_setting.dart';

class WdgGroupApp extends StatelessWidget {
  final CacheManager cacheManager;

  const WdgGroupApp({super.key, required this.cacheManager});

  @override
  Widget build(BuildContext context) {
    return WdgItemNavSetting(
        title: 'Lap English',
        paddingTop: true,
        options: [
          WdgItemButtonNavSetting(icon: Icons.article, text: 'Điều khoản sử dụng', funSetting: () {}),

          WdgItemButtonNavSetting(icon: Icons.thumb_up, text: 'Đánh giá ứng dụng', funSetting: () {}),

          WdgItemButtonNavSetting(icon: Icons.share, text: 'Chia sẻ ứng dụng', funSetting: () {}),

          WdgItemButtonNavSetting(icon: Icons.info,text: 'Giới thiệu', funSetting: () {}),
        ]
    );
  }
}