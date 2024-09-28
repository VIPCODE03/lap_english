import 'package:flutter/material.dart';
import 'package:lap_english/constant/AssetsConstant.dart';

class Row2 extends StatelessWidget {
  final List<_MenuItem> menuItems = [
    _MenuItem(imagePath: "${AssetsConstant.directoryImageMenu}vocabulary.gif",
        label: "Học từ vựng",
        fun: () => print('học từ vựng')
    ),
    _MenuItem(imagePath: "${AssetsConstant.directoryImageMenu}sentence.gif",
        label: "Học câu",
        fun: () => print('học câu')
    ),
    _MenuItem(imagePath: "${AssetsConstant.directoryImageMenu}grammar.gif",
        label: "Học ngữ pháp",
        fun: () => print('học ngữ pháp')
    ),
    _MenuItem(imagePath: "${AssetsConstant.directoryImageMenu}grammar.gif",
        label: "Học phát âm",
        fun: () => print('phát âm')
    ),
    _MenuItem(imagePath: "${AssetsConstant.directoryImageMenu}review.gif",
        label: "Ôn tập",
        fun: () => print('ôn tập')
    ),
    _MenuItem(imagePath: "${AssetsConstant.directoryImageMenu}grammar.gif",
        label: "Luyện viết",
        fun: () => print('luyện viết')
    ),
    _MenuItem(imagePath: "${AssetsConstant.directoryImageMenu}grammar.gif",
        label: "Luyện nghe",
        fun: () => print('luyện nghe')
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Góc học tập'),
      ),
      body:  GridView.count(
          scrollDirection: Axis.horizontal,
          crossAxisCount: 2,
          children: menuItems.map((item) => buildMenuItem(item)).toList(),
        ),
    );
  }

  //ITEM  --------------------------------------------------------------
  Widget buildMenuItem(_MenuItem item) {
    return InkWell(
      onTap: () => item.fun(), // Gọi hàm sự kiện nhấn
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ICON
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue.shade100,
            child: ClipOval(
              child: Image.asset(
                item.imagePath,
                fit: BoxFit.cover,
                width: 60,
                height: 60,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // TEXT
          Text(
            item.label,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class _MenuItem {
  final String imagePath;
  final String label;
  final Function fun;

  _MenuItem({
    required this.imagePath,
    required this.label,
    required this.fun
  });
}
