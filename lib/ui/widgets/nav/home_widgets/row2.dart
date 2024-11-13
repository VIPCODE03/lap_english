import 'package:flutter/material.dart';
import 'package:lap_english/data/model/learn/sentence.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/ui/screens/learn_screens/ipa_screen.dart';
import 'package:lap_english/ui/screens/login_screen.dart';
import 'package:lap_english/ui/screens/menu_screen.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import 'package:lap_english/ui/widgets/other/group.dart';

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
        label: "Từ vựng",
        openScreen: const MenuScreen<MdlMainVocabularyTopic>(title: "Từ vựng theo chủ đề")
    ),
    MenuItem(imagePath: Assets.images.menu.learnSentence.path,
        label: "Câu",
        openScreen: const MenuScreen<MdlMainSentenceTopic>(title: "Câu theo chủ đề")
    ),
    MenuItem(imagePath: Assets.images.menu.learnGrammar.path,
        label: "Ngữ pháp",
        openScreen: const MenuScreen<MdlMainVocabularyTopic>(title: "Câu theo chủ đề")
    ),
    MenuItem(imagePath: Assets.images.menu.learnSpeak.path,
        label: "Phát âm",
        openScreen: IPAScreen()
    ),
    MenuItem(imagePath: Assets.images.menu.learnReview.path,
        label: "Ôn tập",
        openScreen: const MenuScreen<MdlMainSentenceTopic>(title: "Câu theo chủ đề")
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
    return WdgGroup(
        title: "Góc học tập",
        alignment: Alignment.center,
        child: Wrap(
          spacing: 10,
          children: menuItems.map((item) => buildMenuItem(context, item)).toList(),
        )
    );
  }

  ///ITEM  ---------------------------------------------------------------------
  Widget buildMenuItem(BuildContext context, MenuItem item) {
    return WdgButton(
        onTap: () => Navigator.push( //-> Chuyển giao diện
            context,
            MaterialPageRoute(builder: (context) => item.openScreen)),
        color: Colors.transparent,
        child: Column(
          children: [
            ///CONTAINER cover  --------------------------------------------------
            Container(
              height: 66,
              width: 66,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(24)),

              ///ICON ------------------------------------------------------------
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.grey.withAlpha(25).withOpacity(0.5),
                  child: Image.asset(
                    item.imagePath,
                    width: 33,
                    height: 33,
                  ),
                ),
              ),
            ),

            ///TEXT --------------------------------------------------------------
            Text(item.label, maxLines: 1, style: const TextStyle(fontSize: 16))
          ],
        )
    );
  }
}

