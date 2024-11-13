
import 'package:flutter/material.dart';
import 'package:lap_english/data/model/user/user.dart';
import 'package:lap_english/main.dart';

class WdgRow3Profile extends StatelessWidget {
  final User user;

  const WdgRow3Profile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        _item(context, '23', 'Chủ đề đã học'),
        _item(context, '4', 'Danh hiệu'),
        _item(context, '231', 'Ngày đã học'),
        _item(context, '13', ''),
      ],
    );
  }

  Widget _item(BuildContext context, String title, String desc) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey,
        )
      ),
      width: orientation == Orientation.portrait ? maxWidth * 2/5 : maxWidth / 5,
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),

          Text(desc, style:  TextStyle(fontSize: 16, color: Color.alphaBlend(Theme.of(context).primaryColor.withAlpha(70), Colors.grey)),),
        ],
      ),
    );
  }

}