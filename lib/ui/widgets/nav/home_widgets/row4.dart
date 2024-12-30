
import 'package:flutter/material.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/themes/size.dart';
import 'package:lap_english/ui/widgets/other/group.dart';

class WdgRow4 extends StatelessWidget {
  final List<String> data;

  const WdgRow4({
    super.key,
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    return WdgGroup(
      title: 'Truyện',
      child: Wrap(
        children: data.map((dt) {
          return _item(context, null, dt);
        }).toList(),
      ),
    );
  }

  Widget _item(BuildContext context, FileImage? file, String content) {
    return Card(
      child:
          Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1, color: VipColors.onPrimary(context))
            ),
            child: Text(
              content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: textSize.normal,
              ),
            ),
          ),
    );
  }

}
