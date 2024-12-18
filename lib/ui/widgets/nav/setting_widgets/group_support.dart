import 'package:flutter/material.dart';
import 'package:lap_english/ui/widgets/nav/setting_widgets/item_setting.dart';

import '../../../../data/caching/cache_manager.dart';

class WdgGroupSupport extends StatelessWidget {
  final CacheManager cacheManager;

  const WdgGroupSupport({super.key, required this.cacheManager});

  @override
  Widget build(BuildContext context) {
    return WdgItemNavSetting(
        title: 'Hỗ trợ',
        paddingTop: true,
        options: [
          WdgItemButtonNavSetting(icon: Icons.question_mark, text: 'Câu hỏi thường gặp', funSetting: () {}),

          WdgItemButtonNavSetting(icon: Icons.feedback_outlined, text: 'Phản hồi', funSetting: () {}),

        ]
    );
  }
}