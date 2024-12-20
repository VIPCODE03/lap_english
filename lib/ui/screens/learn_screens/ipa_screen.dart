import 'package:flutter/material.dart';
import 'package:lap_english/data/provider/ipa_provider.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/widgets/other/app_bar.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import 'package:lap_english/ui/widgets/other/group.dart';
import 'package:lap_english/ui/widgets/other/scaffold.dart';
import 'package:lap_english/utils/player_audio.dart';
import 'package:lap_english/utils/text_to_speak.dart';

import '../../../data/model/learn/ipa.dart';
import '../../themes/size.dart';

class IPAScreen extends StatelessWidget {
  final AudioPlayerUtil audio = AudioPlayerUtil();
  final TextToSpeakUtil speak = TextToSpeakUtil();
  bool isSpeaking = false;

  IPAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WdgScaffold(
      appBar: const WdgAppBar(title: 'Phiên âm IPA'),
      body: SingleChildScrollView(
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
      )
    );
  }

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
}