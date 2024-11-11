
import 'package:flutter/material.dart';
import 'package:lap_english/data/generate/generate_ipa.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import 'package:lap_english/ui/widgets/other/group.dart';
import 'package:lap_english/utils/player_audio.dart';

import '../../../data/model/learn/ipa.dart';

class IPAScreen extends StatelessWidget {
  final AudioPlayerUtil audio = AudioPlayerUtil();
  IPAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phiên âm IPA')),
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
                  ...generateIPAVowels().map((element) => _itemIPA(context, element)),
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
                  ...generateIPAConsonants().map((element) => _itemIPA(context, element)),
                ])
            )
          ],
        ),
      )
    );
  }

  Widget _itemIPA(BuildContext context, IPA ipa) {
    return SizedBox(
      height: 70,
      width: MediaQuery.of(context).size.width / 6,
      child: WdgButton(
        buttonFit: ButtonFit.scaleDown,
        color: VipColors.getRandomColor(context).withOpacity(0.7),
        onTap: () => audio.playFromAsset(ipa.soundUrl),
        borderRadius: BorderRadius.circular(12),
        child: Text(
          ipa.text,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'DroidSans',
          ),
        ),
      ),
    );
  }
}