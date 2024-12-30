import 'package:flutter/material.dart';
import 'package:lap_english/data/model/learn/status.dart';
import 'package:lap_english/ui/widgets/nav/home_widgets/row1.dart';
import 'package:lap_english/ui/widgets/nav/home_widgets/row2.dart';
import 'package:lap_english/ui/widgets/nav/home_widgets/row3.dart';
import 'package:lap_english/ui/widgets/nav/home_widgets/row4.dart';

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

          ///ROW3  --------------------------------------------------------------
          WdgRow3(topicChats: [
            MdlTopicChat('Chào hỏi',
                'Chủ đề: Chào hỏi, làm quen. model đóng vai trò là 1 người bạn mới làm quen với '
                    'user. Hỏi các thông tin cơ bản của nhau. (Tên , tuổi, giới tính, sở thích, và nhiều thứ nữa)',
                'https://cdn.pixabay.com/photo/2021/01/04/17/27/boy-5888240_960_720.png',
                MdlUnlockStatusManager(gold: 10, diamond: 0, locked: true)
            ),

            MdlTopicChat('Gọi món ăn trong nhà hàng',
                'Chủ đề: Gọi 1 món ăn trong nhà hàng gà rán kfc. model đóng vai trò là chủ nhà hàng. user là khách hàng.'
                    'model sẽ hỏi user về món ăn, gợi ý thực đơn, đầu tiên hãy chào khách hàng',
                'https://free.vector6.com/wp-content/uploads/2021/03/freepng1597-hinh-la-cay-cho-ghep-anh-tach-nen-png-12.png',
                MdlUnlockStatusManager(gold: 10, diamond: 0, locked: true)
            ),

            MdlTopicChat('Đi du lịch',
                'Chủ đề: Nhắn với bạn thân rủ nhau đi du lịch',
                'https://img.hoidap247.com/picture/answer/20200617/large_1592368445663.jpg',
                MdlUnlockStatusManager(gold: 10, diamond: 0, locked: true)
            )
          ]),
          
          ///ROW4  --------------------------------------------------------------
          const SizedBox(
              height: 250,
              child: WdgRow4(data: ["Đối thoại", "Hài hước", "Cổ tích"],)
          ),
        ],
      );
  }
}
