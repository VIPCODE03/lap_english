import 'package:flutter/material.dart';
import 'package:lap_english/ui/widgets/nav/home_widgets/row1.dart';
import 'package:lap_english/ui/widgets/nav/home_widgets/row2.dart';
import 'package:lap_english/ui/widgets/nav/home_widgets/row3.dart';
import 'package:lap_english/ui/widgets/nav/home_widgets/row4.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          ///ROW1  --------------------------------------------------------------
          const SizedBox(
            height: 300,
            child: WdgRow1(),
          ),

          ///ROW2  --------------------------------------------------------------
          SizedBox(
            height: 260,
            child: WdgRow2()
          ),

          ///ROW3  --------------------------------------------------------------
          const SizedBox(
            height: 250,
            child: WdgRow3(data: ["Chủ đề tiếng anh", "Chủ đề tiếng em", "Chủ đề tiếng Trung", "Chủ đề địt nhau", "Chủ đề bú lồn"],)
          ),

          ///ROW4  --------------------------------------------------------------
          const SizedBox(
              height: 250,
              child: WdgRow4(data: ["Phổ biến", "Thường ngày", "Khen ngợi ai đó"],)
          ),

          ///ROW5  --------------------------------------------------------------
          Container(
            height: 150,
            color: Colors.purple,
            child: const Center(child: Text('View 5', style: TextStyle(color: Colors.white, fontSize: 20))),
          ),
        ],
      );
  }
}
