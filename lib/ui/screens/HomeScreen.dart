import 'package:flutter/material.dart';
import 'package:lap_english/ui/widgets/home_widgets/Row1.dart';
import 'package:lap_english/ui/widgets/home_widgets/Row3.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          const SizedBox(
            height: 300,
            child: Row1(),
          ),

          Container(
            height: 150,
            color: Colors.green,
            child: Center(child: Text('View 2', style: TextStyle(color: Colors.white, fontSize: 20))),
          ),

          const Text(
              "Từ vựng",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            height: 150,
            color: Colors.orange,
            child: Row3()
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
