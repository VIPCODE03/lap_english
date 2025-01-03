import 'package:flutter/material.dart';
import 'package:lap_english/ui/widgets/learn/chat/chat_item.dart';
import 'package:lap_english/ui/widgets/other/group.dart';

import '../../../../data/model/learn/chat.dart';

class WdgRow3 extends StatelessWidget {
  final List<MdlTopicChat> topicChats;

  const WdgRow3({
    super.key,
    required this.topicChats
  });

  @override
  Widget build(BuildContext context) {
    return WdgGroup(
      title: 'Trò chuyện',
      height: 15,
      action: GestureDetector(
        onTap: () {

        },
        child: const Text('Xem tất cả', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
      ),
      child: SizedBox(
        height: 150,
        child: GridView.count(
          scrollDirection: Axis.horizontal,
          crossAxisCount: 1,
          children: topicChats.map((topicChat) {
            return WdgChatItem(topicChat: topicChat);
          }).toList(),
        ),
      )
    );
  }
}
