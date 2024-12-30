import 'package:flutter/material.dart';
import 'package:lap_english/data/model/learn/grammar.dart';
import 'package:lap_english/data/model/learn/word_sentence.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/screens/learn_screens/ipa_screen.dart';
import 'package:lap_english/ui/screens/learn_screens/library_screen.dart';
import 'package:lap_english/ui/screens/menu_screen.dart';
import 'package:lap_english/ui/themes/size.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import 'package:lap_english/ui/widgets/other/group.dart';

class MenuItem {
  final String imagePath;
  final String label;
  final int openScreen;

  MenuItem({
    required this.imagePath,
    required this.label,
    required this.openScreen
  });
}

class WdgRow2 extends StatelessWidget {

  Widget _getMenu(int index) => [
    const MenuScreen<MainTopic>(title: "Từ vựng theo chủ đề", args: Word),

    const MenuScreen<MainTopic>(title: "Câu theo chủ đề", args: Sentence),

    const MenuScreen<TypeGrammar>(title: "Ngữ pháp"),

    IPAScreen(),

    const LibraryScreen()
  ].elementAt(index);

  final List<MenuItem> _menuItems = [
    MenuItem(imagePath: Assets.images.menu.learnVocabulary.path,
        label: "Từ vựng",
        openScreen: 0
    ),
    MenuItem(imagePath: Assets.images.menu.learnSentence.path,
        label: "Câu",
        openScreen: 1
    ),
    MenuItem(imagePath: Assets.images.menu.learnGrammar.path,
        label: "Ngữ pháp",
        openScreen: 2
    ),
    MenuItem(imagePath: Assets.images.menu.learnSpeak.path,
        label: "Phát âm",
        openScreen: 3
    ),
    MenuItem(imagePath: Assets.images.menu.library.path,
        label: "Thư viện",
        openScreen: 4
    ),
  ];

  WdgRow2({super.key});

  @override
  Widget build(BuildContext context) {
    return WdgGroup(
        title: "Góc học tập",
        alignment: Alignment.center,
        child: Wrap(
          spacing: 6,
          runSpacing: 6,
          children: _menuItems.map((item) => buildMenuItem(context, item)).toList(),
        )
    );
  }

  ///ITEM  ---------------------------------------------------------------------
  Widget buildMenuItem(BuildContext context, MenuItem item) {
    return WdgButton(
        onTap: () => Navigator.push( //-> Chuyển giao diện
            context,
            MaterialPageRoute(builder: (context) => _getMenu(item.openScreen))),
        color: Colors.transparent,
        child: Column(
          children: [
            ///CONTAINER cover  --------------------------------------------------
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: VipColors.onPrimary(context),
                  border: Border.all(color: VipColors.primary(context), width: 1.5, strokeAlign: 2),
                  borderRadius: BorderRadius.circular(33)
              ),

              ///ICON ------------------------------------------------------------
              child: Image.asset(
                  item.imagePath,
                  width: 33,
                  height: 33,
                ),
              ),

            ///TEXT --------------------------------------------------------------
            Text(item.label, maxLines: 1, style: TextStyle(fontSize: textSize.normal))
          ],
        )
    );
  }
}

