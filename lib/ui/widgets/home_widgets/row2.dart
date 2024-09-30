import 'package:flutter/material.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/test.dart';
import 'package:lap_english/ui/screens/learn_screen/learn_vocabulay_screen.dart';
import 'package:lap_english/ui/screens/login_screen.dart';

import '../../../data/bloc/viewtest.dart';

class Row2 extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(imagePath: Assets.images.menu.learnVocabulay.path,
        label: "Học từ vựng",
        openScreen: VocabularyPage()
    ),
    MenuItem(imagePath: Assets.images.menu.learnSentence.path,
        label: "Học câu",
        openScreen: HomeScreen()
    ),
    MenuItem(imagePath: Assets.images.menu.learnGrammar.path,
        label: "Học ngữ pháp",
        openScreen: const LearnVocabularyScreen()
    ),
    MenuItem(imagePath: Assets.images.menu.learnSpeak.path,
        label: "Học phát âm",
        openScreen: const LoginScreen()
    ),
    MenuItem(imagePath: Assets.images.menu.learnReview.path,
        label: "Ôn tập",
        openScreen: const LoginScreen()
    ),
    MenuItem(imagePath: Assets.images.menu.learnWrite.path,
        label: "Luyện viết",
        openScreen: const LoginScreen()
    ),
    MenuItem(imagePath: Assets.images.menu.learnListen.path,
        label: "Luyện nghe",
        openScreen: const LoginScreen()
    ),
  ];

  Row2({super.key});

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
  Widget buildMenuItem(BuildContext context, MenuItem item) {
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

class MenuItem {
  final String imagePath;
  final String label;
  final Widget openScreen;

  MenuItem({
    required this.imagePath,
    required this.label,
    required this.openScreen
  });
}
