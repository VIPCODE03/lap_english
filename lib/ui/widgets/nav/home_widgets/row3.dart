import 'package:flutter/material.dart';
import 'package:lap_english/ui/screens/learn_screens/chatbot_screen.dart';
import 'package:lap_english/ui/themes/size.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
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
      child: SizedBox(
        height: 225,
        child: GridView.count(
          scrollDirection: Axis.horizontal,
          crossAxisCount: 1,
          children: topicChats.map((dt) {
            return _item(context, dt);
          }).toList(),
        ),
      )
    );
  }

  Widget _item(BuildContext context, MdlTopicChat topicChat) {
    return SizedBox(
      child: Column(
        children: [
          ///ClipRRect hình ảnh  ------------------------------------------------
          ClipRRect(
            child: Container(
              height: 125,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(topicChat.imgUrl),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),

          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    topicChat.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: textSize.medium,
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: WdgButton(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ChatBotScreen(topicChat: topicChat))
                    ),
                    borderRadius: BorderRadius.circular(12),
                    child: Text('Bắt đầu', style: TextStyle(fontSize: textSize.normal, fontWeight: FontWeight.bold)),
                )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
