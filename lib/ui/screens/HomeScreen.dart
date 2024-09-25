import 'package:flutter/material.dart';
import 'package:lap_english/ui/widgets/home_widgets/Row1.dart';
import 'package:lap_english/ui/widgets/home_widgets/Row3.dart';
import 'package:lap_english/ui/widgets/other/Test.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return ListView(
        children: [
          const SizedBox(
            height: 300,
            child: Row1(),
          ),

          Container(
            height: 150,
            color: Colors.green,
            child: ExpandableView(maxHeight: maxHeight, maxWight: maxWidth)
          ),

          Text(
            "Từ vựng",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Container(
            height: 210,
            color: Colors.orange,
            child: const Row3(data: ["Chủ đề tiếng anh", "Chủ đề tiếng em", "Chủ đề tiếng Trung", "Chủ đề địt nhau", "Chủ đề bú lồn"],)
          ),
          Container(
            height: 150,
            color: Colors.red,
              child: TextField(
                cursorColor: Colors.grey,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  labelText: 'Tìm kiếm',
                ),
                onChanged: (text) {
                  print('Text changed to: $text');
                },
              )
          ),
          Container(
            height: 150,
            color: Colors.purple,
            child: Center(child: Text('View 5', style: TextStyle(color: Colors.white, fontSize: 20))),
          ),
          Container(
            height: 150,
            color: Colors.greenAccent,
            child: Center(child: Text('View 5', style: TextStyle(color: Colors.white, fontSize: 20))),
          ),
        ],
      );
  }
}
