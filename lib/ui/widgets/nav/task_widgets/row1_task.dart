import 'package:flutter/material.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/themes/size.dart';

class WdgRow1Task extends StatelessWidget {
  const WdgRow1Task({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      color: VipColors.onPrimary(context).withOpacity(0.1),
      height: 250,
      child: Stack(
        children: [
          /// Text  ------------------------------------------------------------
          Positioned(
            bottom: 30,
            left: 20,
            right: maxWidth / 2.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chào mừng bạn trở lại',
                  style: TextStyle(fontSize: textSize.title,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Hãy nhớ quay lại đây để nhận thưởng nhé <3',
                  style: TextStyle(
                    fontSize: textSize.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}