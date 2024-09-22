import 'package:flutter/material.dart';

class Row1 extends StatelessWidget {
  const Row1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/cover2.gif'),  //->  Thay đổi hình nền ở đây
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //TEXT họ tên ------------------------------------------------------
            const Positioned(
              top: 10,
              left: 10,
              child: Text(
                "Đào Như Triệu",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Georgia'
                ),
              ),
            ),

            //ICONBUTTON settings ----------------------------------------------
            Positioned(
              right: 10,
              child:
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  print("Icon button pressed");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}