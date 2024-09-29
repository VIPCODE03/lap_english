import 'package:flutter/material.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/test.dart';
import 'package:lap_english/ui/screens/login_screen.dart';

class Row2 extends StatelessWidget {
  final List<_MenuItem> menuItems = [
    _MenuItem(imagePath: Assets.images.menu.vocabulary.path,
        label: "Học từ vựng",
        openScreen: const LoginScreen()
    ),
    _MenuItem(imagePath: Assets.images.menu.sentence.path,
        label: "Học câu",
        openScreen: HomeScreen()
    ),
    _MenuItem(imagePath: Assets.images.menu.grammar.path,
        label: "Học ngữ pháp",
        openScreen: const LoginScreen()
    ),
    _MenuItem(imagePath: Assets.images.menu.grammar.path,
        label: "Học phát âm",
        openScreen: const LoginScreen()
    ),
    _MenuItem(imagePath: Assets.images.menu.review.path,
        label: "Ôn tập",
        openScreen: const LoginScreen()
    ),
    _MenuItem(imagePath: Assets.images.menu.sentence.path,
        label: "Luyện viết",
        openScreen: const LoginScreen()
    ),
    _MenuItem(imagePath: Assets.images.menu.sentence.path,
        label: "Luyện nghe",
        openScreen: const LoginScreen()
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Góc học tập',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
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
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => item.openScreen)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ICON
          CircleAvatar(
            radius: 35,
            backgroundColor: Theme.of(context).primaryColor,
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
  final Widget openScreen;

  _MenuItem({
    required this.imagePath,
    required this.label,
    required this.openScreen
  });
}
