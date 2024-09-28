import 'package:flutter/material.dart';
import 'package:lap_english/ui/widgets/home_widgets/Row1.dart';
import 'package:lap_english/ui/widgets/home_widgets/Row2.dart';
import 'package:lap_english/ui/widgets/home_widgets/Row3.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          //ROW1  --------------------------------------------------------------
          const SizedBox(
            height: 300,
            child: Row1(),
          ),


          //ROW2  --------------------------------------------------------------
          SizedBox(
            height: 300,
            child: Row2()
          ),

          //ROW3  --------------------------------------------------------------
          Text(
            "Từ vựng",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 210,
            child: Row3(data: ["Chủ đề tiếng anh", "Chủ đề tiếng em", "Chủ đề tiếng Trung", "Chủ đề địt nhau", "Chủ đề bú lồn"],)
          ),

          //ROW4  --------------------------------------------------------------
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

          //ROW5  --------------------------------------------------------------
          Container(
            height: 150,
            color: Colors.purple,
            child: Center(child: Text('View 5', style: TextStyle(color: Colors.white, fontSize: 20))),
          ),
        ],
      );
  }
}
