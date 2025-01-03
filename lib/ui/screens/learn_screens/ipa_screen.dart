import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lap_english/data/provider/ipa_provider.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/screens/learn_screens/quizz_screen.dart';
import 'package:lap_english/ui/widgets/other/app_bar.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import 'package:lap_english/ui/widgets/other/group.dart';
import 'package:lap_english/ui/widgets/other/progress_bar.dart';
import 'package:lap_english/ui/widgets/other/scaffold.dart';
import 'package:lap_english/utils/player_audio.dart';
import 'package:lap_english/utils/text_to_speak.dart';

import '../../../data/model/learn/ipa.dart';
import '../../themes/size.dart';

class IPAScreen extends StatefulWidget {

  const IPAScreen({super.key});

  @override
  State<StatefulWidget> createState() => _IPAScreenState();
}

class _IPAScreenState extends State<IPAScreen> with SingleTickerProviderStateMixin {
  late AudioPlayerUtil audio;
  late TextToSpeakUtil speak;
  late bool isSpeaking;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    audio = AudioPlayerUtil();
    speak = TextToSpeakUtil();
    isSpeaking = false;
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return WdgScaffold(
        appBar: const WdgAppBar(title: 'Phiên âm IPA'),
        body: Padding(padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Column(
            children: [
              /// View title  ----------------------------------------------------
              TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,
                indicatorColor: VipColors.onPrimary(context),
                labelColor: VipColors.text(context),
                isScrollable: true,
                splashBorderRadius: BorderRadius.circular(12),
                tabAlignment: TabAlignment.center,
                labelStyle: GoogleFonts.pangolin(fontSize: textSize.normal, color: VipColors.text(context)),
                tabs: const [
                  Tab(text: 'Bảng IPA'),
                  Tab(text: 'Luyện tập'),
                ],
              ),

              /// View content  --------------------------------------------------
              Expanded(child: TabBarView(
                controller: _tabController,
                children: [
                  /// Bảng IPA  --------------------------------------------------
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        WdgGroup(
                            title: 'Nguyên âm',
                            opacity: 0,
                            height: 0,
                            alignment: Alignment.center,
                            child: Wrap(
                                runSpacing: 8,
                                spacing: 8,
                                children: [
                                  ...IPAProvider.ipaVowels().map((element) => _itemIPA(context, element)),
                                ])
                        ),

                        WdgGroup(
                            title: 'Phụ âm',
                            opacity: 0,
                            height: 10,
                            alignment: Alignment.center,
                            child: Wrap(
                                runSpacing: 8,
                                spacing: 8,
                                children: [
                                  ...IPAProvider.ipaConsonants().map((element) => _itemIPA(context, element)),
                                ])
                        ),

                        const SizedBox(height: 15)
                      ],
                    ),
                  ),

                  /// Luyện tập --------------------------------------------------
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: (isPortrait && !isTablet) ? 2 : 4,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: IPAProvider.ipaVowels().length + IPAProvider.ipaConsonants().length,
                    itemBuilder: (context, index) {
                      final items = [...IPAProvider.ipaVowels(), ...IPAProvider.ipaConsonants()];
                      return _itemExerciseIPA(context, items[index]);
                    },
                  )

                ],
              )),
            ],
          ),
        )
    );
  }

  /// Item của bảng ------------------------------------------------------------
  Widget _itemIPA(BuildContext context, IPA ipa) {
    return SizedBox(
      width: (isPortrait) ? maxWidth / 5 : maxWidth / 7,
      child: WdgButton(
          color: VipColors.getRandomColor(context, 50),
          onTap: () async {
            if (isSpeaking) return;

            isSpeaking = true;

            try {
              audio.playFromAsset(ipa.soundUrl);

              await Future.delayed(const Duration(seconds: 1));

              await speak.speak(
                ipa.example,
                TextToSpeakUtil.languageUS,
                TextToSpeakUtil.rateNormal,
              );
            } finally {
              isSpeaking = false;
            }
          },
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              Text(
                ipa.text,
                style: TextStyle(
                  fontSize: textSize.title,
                  fontFamily: 'DroidSans',
                ),
              ),

              FittedBox(
                child: Text(
                  ipa.example,
                  style: TextStyle(
                    fontSize: textSize.normal,
                  ),
                ),
              )
            ],
          )
      ),
    );
  }

  /// Item của exercise --------------------------------------------------------
  Widget _itemExerciseIPA(BuildContext context, IPA ipa) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: Center(
            child: Container(
              height: 66,
              width: 66,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: VipColors.onPrimary(context).withAlpha(33),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(ipa.text, style: const TextStyle(fontSize: 30, fontFamily: 'DroidSans')),
            )
          )),

          SizedBox(
            height: 16,
            child: WdgAnimatedProgressBar(value: ipa.maxPronunciationScore),
          ),

          SizedBox(
            height: 50,
            width: maxWidth,
            child: WdgButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuizzScreen.ipa(ipas: [ipa]))
                  );
                },
                borderRadius: BorderRadius.circular(12),
                alpha: 6,
                child: Text('Học', style: TextStyle(fontSize: textSize.title, fontWeight: FontWeight.bold))
            ),
          )
        ],
      ),
    );
  }
}