import 'package:flutter/material.dart';
import 'package:lap_english/data/model/learn/chat.dart';
import '../../../screens/learn_screens/chatbot_detail_screen.dart';
import '../../../themes/size.dart';

class WdgChatItem extends StatelessWidget {
  final MdlTopicChat topicChat;

  const WdgChatItem({Key? key, required this.topicChat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChatBotDetail(topicChat: topicChat),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Hình ảnh với ClipRRect
            ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: AspectRatio(
                  aspectRatio: 5 / 3,
                  child: Image.network(
                    topicChat.imgUrl,
                  ),
                ),
            ),

            /// Thông tin chủ đề
            Padding(
              padding: const EdgeInsets.all(3),
              child: Text(
                topicChat.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: textSize.normal,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
