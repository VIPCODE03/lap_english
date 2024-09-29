import 'package:flutter/material.dart';
import 'package:lap_english/constant/assets_constant.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/ui/widgets/other/progress_bar.dart';

class Row3 extends StatelessWidget {
  final List<String> data;

  const Row3({
    super.key,
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        scrollDirection: Axis.horizontal,
        crossAxisCount: 1,
        children: data.map((dt) {
          return _item(context, null, dt, 3, data.length);
        }).toList(),
      ),
    );
  }

  Widget _item(BuildContext context, FileImage? file, String content, int done, int total) {
    double value = (done/total);
    return Card(
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child:  Image(image: file ?? Assets.images.item.itemTopic.provider()),
          ),
          Text(
            content,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Stack(
              children: [
                AnimatedProgressBar(
                    value: value,
                    label: 'Đã học $done/$total',
                    duration: const Duration(milliseconds: 700),
                ),
              ]
            ),
          )
        ],
      ),
    );
  }
}
