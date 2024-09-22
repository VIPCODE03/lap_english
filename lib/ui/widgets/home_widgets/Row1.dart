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

            Positioned(
              bottom: 0,
              right: 10,
              left: 10,
              child: Card(
                child: Center(
                  child: Container(
                    width: 500,
                    // Chiều rộng của thẻ
                    padding: const EdgeInsets.all(16),
                    // Khoảng cách bên trong thẻ
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tiêu đề 1",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(height: 8),
                              Text("Mô tả nội dung 1"),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tiêu đề 2",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(height: 8),
                              Text("Mô tả nội dung 2"),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tiêu đề 3",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(height: 8),
                              Text("Mô tả nội dung 3"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}