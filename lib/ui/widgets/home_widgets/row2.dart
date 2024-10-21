import 'package:flutter/material.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/ui/screens/login_screen.dart';

import '../../screens/menu_screen/menu_vocabulary_screen.dart';
import '../../screens/menu_screen/menu_sentence_screen.dart';

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

class WdgRow2 extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(imagePath: Assets.images.menu.learnVocabulary.path,
        label: "Học từ vựng",
        openScreen: const MenuVocabularyScreen()
    ),
    MenuItem(imagePath: Assets.images.menu.learnSentence.path,
        label: "Học câu",
        openScreen: const MenuSentenceScreen()
    ),
    MenuItem(imagePath: Assets.images.menu.learnGrammar.path,
        label: "Học ngữ pháp",
        openScreen: const MenuVocabularyScreen()
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

  WdgRow2({super.key});

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

  ///ITEM  ---------------------------------------------------------------------
  Widget buildMenuItem(BuildContext context, MenuItem item) {
    return InkWell(
      //--- Chuyển sang giao diện học tập  ---
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => item.openScreen)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///CONTAINER cover  --------------------------------------------------
          Container(
            padding: const EdgeInsets.all(1.5),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20)
            ),
            ///ICON ------------------------------------------------------------
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.all(6),
                color: Colors.white54,
                child: Image.asset(
                  item.imagePath,
                  width: 45,
                  height: 45,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          ///TEXT --------------------------------------------------------------
          Text(item.label, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

