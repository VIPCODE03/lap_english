
import 'package:flutter/material.dart';
import 'package:lap_english/data/model/user/user.dart';
import 'package:lap_english/main.dart';

import '../../../colors/vip_colors.dart';

class WdgRow3Profile extends StatelessWidget {
  final User user;

  const WdgRow3Profile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      children: [
        _item(context, '23', 'Chủ đề đã học'),
        _item(context, '4', 'Danh hiệu'),
        _item(context, '231', 'Ngày đã học'),
        _item(context, '13', 'adss'),
      ],
    );
  }

  Widget _item(BuildContext context, String title, String desc) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey,
        )
      ),
      width: orientation == Orientation.portrait ? maxWidth * 2/5 : maxWidth / 5,
      child: Column(
        children: [
          Text(title, style: TextStyle(
              fontSize: 20,
              color: VipColors.text(context),
            fontWeight: FontWeight.bold
          )),

          Text(desc, style:  const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

}