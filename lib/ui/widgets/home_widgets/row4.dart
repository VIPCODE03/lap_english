
import 'package:flutter/material.dart';
import 'package:lap_english/gen/assets.gen.dart';

class Row4 extends StatelessWidget {
  final List<String> data;

  const Row4({
    super.key,
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gợi ý',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: GridView.count(
        scrollDirection: Axis.horizontal,
        crossAxisCount: 1,
        children: data.map((dt) {
          return _item(context, null, dt);
        }).toList(),
      ),
    );
  }

  Widget _item(BuildContext context, FileImage? file, String content) {

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          //ClipRRect hình ảnh  ------------------------------------------------
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

          //
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Căn lề bên trái
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0), // Thêm khoảng cách
                  child: Text(
                    content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
