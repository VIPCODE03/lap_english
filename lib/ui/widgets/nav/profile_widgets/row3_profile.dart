
import 'package:flutter/material.dart';
import 'package:lap_english/data/model/user/user.dart';

import '../../../colors/vip_colors.dart';
import '../../../themes/size.dart';

class WdgRow3Profile extends StatelessWidget {
  final User user;

  const WdgRow3Profile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      children: [
        _item(context, '${user.accumulate.words}', 'Từ vựng'),
        _item(context, '${user.accumulate.sentences}', 'Câu'),
        _item(context, '${user.accumulate.daysLearned}', 'Ngày học cùng LAP'),
        _item(context, '${user.accumulate.titles}', 'Danh hiệu'),
      ],
    );
  }

  Widget _item(BuildContext context, String title, String desc) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey,
          )
        ),
        width: isPortrait ? maxWidth * 2/5 : maxWidth / 5,
        child: Column(
          children: [
            Text(title, style: TextStyle(
                fontSize: textSize.medium,
                color: VipColors.text(context),
                fontWeight: FontWeight.bold
            )),

            Text(desc, style: TextStyle(fontSize: textSize.normal, color: Colors.grey)),
          ],
      ))
    );
  }

}