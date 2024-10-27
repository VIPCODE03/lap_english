import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class WdgRow1Task extends StatelessWidget {
  const WdgRow1Task({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      height: 250,
      child: Stack(
        children: [
          /// Text  ------------------------------------------------------------
          const Positioned(
            bottom: 30,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chào mừng bạn trở lại',
                  style: TextStyle(fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Học tập mỗi ngày để có thêm nhiều phần thưởng',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          /// Ảnh -------------------------------------------------------------
          Positioned(
            bottom: 10,
            right: 10,
            child: Image.asset(
              Assets.images.dinosaur.dinosaurTeacher.path,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}