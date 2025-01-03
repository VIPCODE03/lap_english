import 'package:flutter/material.dart';
import 'package:lap_english/data/model/learn/status.dart';
import 'package:lap_english/ui/widgets/nav/home_widgets/row1.dart';
import 'package:lap_english/ui/widgets/nav/home_widgets/row2.dart';
import 'package:lap_english/ui/widgets/nav/home_widgets/row3.dart';
import 'package:lap_english/ui/widgets/nav/home_widgets/row_challenge.dart';
import 'package:lap_english/ui/widgets/nav/home_widgets/row_tip_widget.dart';

import '../../../data/model/learn/chat.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          ///ROW1  --------------------------------------------------------------
          const WdgRow1(),

          ///ROW2  --------------------------------------------------------------
          WdgRow2(),

          const WdgRowTip(),

          ///ROW3  --------------------------------------------------------------
          WdgRow3(topicChats: [
            MdlTopicChat('Chào hỏi',
                'Chủ đề: Chào hỏi, làm quen. model đóng vai trò là 1 người bạn mới làm quen với '
                    'user. Hỏi các thông tin cơ bản của nhau. (Tên , tuổi, giới tính, sở thích, và nhiều thứ nữa)',
                'https://img.lovepik.com/free-png/20210919/lovepik-wave-goodbye-to-the-boy-png-image_400432265_wh1200.png',
                MdlUnlockStatusManager(gold: 10, diamond: 0, locked: true)
            ),

            MdlTopicChat('Gọi món ăn trong nhà hàng',
                'Chủ đề: Gọi 1 món ăn trong nhà hàng gà rán kfc. model đóng vai trò là chủ nhà hàng. user là khách hàng.'
                    'model sẽ hỏi user về món ăn, gợi ý thực đơn, đầu tiên hãy chào khách hàng',
                'https://img.lovepik.com/free-png/20210923/lovepik-cartoon-house-villa-floor-home-png-image_401239195_wh1200.png',
                MdlUnlockStatusManager(gold: 10, diamond: 0, locked: true)
            ),

            MdlTopicChat('Đi du lịch',
                'Chủ đề: Nhắn với bạn thân rủ nhau đi du lịch',
                'https://th.bing.com/th/id/OIP.BZPWC7gdSq7-wKism63bSwHaHa?rs=1&pid=ImgDetMain',
                MdlUnlockStatusManager(gold: 10, diamond: 0, locked: true)
            ),

            MdlTopicChat('Đi mua sắm',
                'Chủ đề: Đi mua sắm tại cửa hàng tiện lợi, model sẽ đóng vai trò 1 chủ cửa hàng, user là người mua hàng',
                'https://th.bing.com/th/id/OIP.jxud_dQF2hZQZFvSEJgcjwHaG_?rs=1&pid=ImgDetMain',
                MdlUnlockStatusManager(gold: 10, diamond: 0, locked: true)
            )
          ]),
          
          ///ROW4  --------------------------------------------------------------
          const SizedBox(
              height: 250,
              child: WdgRow4()
          ),
        ],
      );
  }
}
