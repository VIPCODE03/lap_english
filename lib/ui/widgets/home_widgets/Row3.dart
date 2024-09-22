import 'package:flutter/material.dart';

class Row3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.count(
          scrollDirection: Axis.horizontal,
          crossAxisCount: 1,
          children: List.generate(5, (index) {
            return Container(
              margin: const EdgeInsets.all(8.0),
              color: Colors.blueAccent,
              width: 150,
              child: Center(
                child: Text(
                  'Item $index',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
