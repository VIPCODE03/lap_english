import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/ui/widgets/other/group.dart';
import 'package:lap_english/ui/widgets/other/progress_bar.dart';

class WdgRow3 extends StatelessWidget {
  final List<String> data;

  const WdgRow3({
    super.key,
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    return WdgGroup(
      title: 'Đang học',
      child: SizedBox(
        height: 200,
        child: GridView.count(
          scrollDirection: Axis.horizontal,
          crossAxisCount: 1,
          children: data.map((dt) {
            return _item(context, Assets.images.item.dongvat.provider(), dt, 3, data.length + Random().nextInt(5));
          }).toList(),
        ),
      )
    );
  }

  Widget _item(BuildContext context, ImageProvider? file, String content, int done, int total) {
    double value = (done / total);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ///ClipRRect hình ảnh  ------------------------------------------------
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: file ?? Assets.images.item.itemTopic.provider(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    content,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: WdgAnimatedProgressBar(
                    value: value,
                    label: 'Đã học $done/$total',
                    duration: const Duration(milliseconds: 700),
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }

}
