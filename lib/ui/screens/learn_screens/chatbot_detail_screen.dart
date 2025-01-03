import 'package:flutter/material.dart';
import 'package:lap_english/data/model/learn/chat.dart';
import 'package:lap_english/ui/themes/size.dart';
import 'package:lap_english/ui/widgets/other/app_bar.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import 'package:lap_english/ui/widgets/other/group.dart';
import 'package:lap_english/ui/widgets/other/scaffold.dart';

import '../../colors/vip_colors.dart';
import 'chatbot_screen.dart';

class ChatBotDetail extends StatelessWidget {
  final MdlTopicChat topicChat;

  const ChatBotDetail({
    super.key,
    required this.topicChat,
  });

  @override
  Widget build(BuildContext context) {
    return WdgScaffold(
        appBar: const WdgAppBar(),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                /// Tên chủ đề  ----------------------------------------------------
                Text(topicChat.name,
                    style: TextStyle(fontSize: textSize.medium, color: VipColors.text(context))
                ),

                Expanded(
                    child: Stack(
                      children: [
                        /// Ảnh ------------------------------------------------------------
                        Center(
                            child: Opacity(
                                opacity: 0.1,
                                child: Image.network(topicChat.imgUrl))
                        ),

                        ListView(
                          children: [
                            WdgGroup(
                                title: 'Mô tả',
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 3, color: VipColors.onPrimary(context)),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Text(topicChat.describe, style: TextStyle(fontSize: textSize.normal)),
                                )
                            ),

/*
                            WdgGroup(
                                title: 'Nội dung',
                                height: 20,
                                child: Card(
                                  child: Padding(padding: const EdgeInsets.all(6),
                                    child: Table(
                                      children: [
                                        TableRow(
                                          children: [
                                            Container(
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  border: Border.all(width: 1)
                                                ),
                                                child: Text('1', style: TextStyle(fontSize: textSize.title, color: VipColors.text(context)))
                                            ),
                                            Center(child: Text('Mở lời chào', style: TextStyle(fontSize: textSize.medium))),
                                          ]
                                        ),
                                        TableRow(
                                            children: [
                                              Center(child: Text('2', style: TextStyle(fontSize: textSize.title, color: VipColors.text(context)))),
                                              Expanded(child: Center(child: Text('Giới thiệu bản thân', style: TextStyle(fontSize: textSize.medium))))
                                            ]
                                        )
                                      ],
                                    ),
                                  )

                                )
                            ),
*/
                          ],
                        ),
                  ],
                )),

                Container(
                    padding: const EdgeInsets.all(6),
                    height: 66,
                    width: maxWidth,
                    child: WdgButton(
                      onTap: () => Navigator.of(context).push(PageRouteBuilder(
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                          pageBuilder: (context, animation, secondaryAnimation) => ChatBotScreen(topicChat: topicChat))),
                      borderRadius: BorderRadius.circular(12),
                      alpha: 66,
                      child: Text('Bắt đầu',
                          style: TextStyle(
                              fontSize: textSize.medium,
                              fontWeight: FontWeight.bold)),
                    )
                ),
              ],
            )
        )
    );
  }
}
