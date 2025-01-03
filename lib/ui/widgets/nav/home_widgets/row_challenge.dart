import 'package:flutter/material.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/dialogs/dialog_widget.dart';
import 'package:lap_english/ui/screens/learn_screens/challenge_screen.dart';
import 'package:lap_english/ui/themes/size.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import 'package:lap_english/ui/widgets/other/group.dart';

class WdgRow4 extends StatelessWidget {
  const WdgRow4({super.key});

  @override
  Widget build(BuildContext context) {
    return WdgGroup(
        title: 'Thử thách',
        height: 20,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Card(
              child: Container(
                  height: 150,
                  width: maxWidth,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                          child: SizedBox(
                              width: maxWidth / 1.3,
                              child: Text(
                                  'Tham gia thử thách với bài học siêu thú vị với kiến thức mới mỗi ngày',
                                  style: TextStyle(
                                      fontSize: textSize.normal,
                                      color: Colors.grey),
                                  textAlign: TextAlign.center,
                              ),
                          )
                      ),
                      SizedBox(
                        height: 50,
                        width: maxWidth / 1.3,
                        child: WdgButton(
                            onTap: () {
                              _dialog(context);
                            },
                            borderRadius: BorderRadius.circular(10),
                            alpha: 33,
                            child: Text('Tham gia thử thách',
                                style: TextStyle(
                                    fontSize: textSize.normal,
                                    fontWeight: FontWeight.bold,
                                    color: VipColors.text(context))
                            )
                        ),
                      )
                    ],
                  )),
            )
        )
    );
  }

  void _dialog(BuildContext parentContext) {
    showDialog(
        context: parentContext,
        builder: (context) {
          return WdgDialog(
            shadow: true,
            border: true,
            title: Text('Tham gia thử thách',
              style: TextStyle(
                  fontSize: textSize.title,
                  color: VipColors.text(context),
                  fontWeight: FontWeight.bold
              ),
            ),

            content: SizedBox(
              width: maxWidth / 2,
              child: WdgButton(
                  onTap: () {
                      Navigator.pop(context);

                      Navigator.push(parentContext,
                          MaterialPageRoute(builder: (parentContext) => const ChallengeScreen())
                      );
                    },
                  borderRadius: BorderRadius.circular(12),
                  alpha: 66,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('50',
                          style: TextStyle(
                              color: Colors.yellow,
                            fontSize: 24
                          )
                      ),
                      
                      Image(
                        image: Assets.images.icon.gold.provider(),
                        height: 25,
                        width: 25,
                      )
                    ],
                  )
              ),
            )
          );
        }
    );
  }
}
