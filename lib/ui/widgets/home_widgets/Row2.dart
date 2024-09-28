import 'package:flutter/material.dart';
import 'package:lap_english/constant/AssetsConstant.dart';
import 'package:lap_english/test.dart';
import 'package:lap_english/ui/screens/LoginScreen.dart';

class Row2 extends StatelessWidget {
  final List<_MenuItem> menuItems = [
    _MenuItem(imagePath: "${AssetsConstant.directoryImageMenu}vocabulary.gif",
        label: "Học từ vựng",
        widget: const LoginScreen()
    ),
    _MenuItem(imagePath: "${AssetsConstant.directoryImageMenu}sentence.gif",
        label: "Học câu",
        widget: HomeScreen()
    ),
    _MenuItem(imagePath: "${AssetsConstant.directoryImageMenu}grammar.gif",
        label: "Học ngữ pháp",
        widget: const LoginScreen()
    ),
    _MenuItem(imagePath: "${AssetsConstant.directoryImageMenu}grammar.gif",
        label: "Học phát âm",
        widget: const LoginScreen()
    ),
    _MenuItem(imagePath: "${AssetsConstant.directoryImageMenu}review.gif",
        label: "Ôn tập",
        widget: const LoginScreen()
    ),
    _MenuItem(imagePath: "${AssetsConstant.directoryImageMenu}grammar.gif",
        label: "Luyện viết",
        widget: const LoginScreen()
    ),
    _MenuItem(imagePath: "${AssetsConstant.directoryImageMenu}grammar.gif",
        label: "Luyện nghe",
        widget: const LoginScreen()
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
          children: menuItems.map((item) => buildMenuItem(context, item)).toList(),
        ),
    );
  }

  //ITEM  --------------------------------------------------------------
  Widget buildMenuItem(BuildContext context, _MenuItem item) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => item.widget)),
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
  final Widget widget;

  _MenuItem({
    required this.imagePath,
    required this.label,
    required this.widget
  });
}
