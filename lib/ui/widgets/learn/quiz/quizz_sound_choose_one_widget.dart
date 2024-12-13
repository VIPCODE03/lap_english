import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz/quizz_sound_choose_one.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizz_widget.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import 'package:lap_english/utils/loaddata_link.dart';
import 'package:lap_english/utils/player_audio.dart';
import '../../../../../utils/text_to_speak.dart';
import '../../../../main.dart';
import '../../../themes/size.dart';

class WdgQuizzSoundChooseOne extends WdgQuizz<QuizzSoundChooseOne> {
  WdgQuizzSoundChooseOne({super.key, required super.quizz});

  @override
  WdgQuizzState<QuizzSoundChooseOne, WdgQuizz<QuizzSoundChooseOne>> createState()
  => _WdgQuizzSoundChooseOneState();
}

class _WdgQuizzSoundChooseOneState extends WdgQuizzState<QuizzSoundChooseOne, WdgQuizzSoundChooseOne> {
  final TextToSpeakUtil _textToSpeakUtil = TextToSpeakUtil();
  final AudioPlayerUtil _audioPlayerUtil = AudioPlayerUtil();
  String? selectedKey; //-> Biến lưu item được chọn

  @override
  void initState() {
    super.initState();

    //--- Phát âm thanh ---
    widget.status.isStarted.addListener(() {
      if(widget.status.isStarted.value && widget.quizz.showSoundBox) {
        _speak(widget.quizz.answerCorrect);
      }
    });

    hasChanged.addListener(update);

  }

  void update() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _textToSpeakUtil.dispose();
    hasChanged.removeListener(update);
  }

  //=== Speak ===
  Future<void> _speak(String text) async {
    String soundUrl = widget.quizz.sounds[text] ?? "";
    if(soundUrl.isEmpty) {
      _textToSpeakUtil.speak(text, TextToSpeakUtil.languageAU, TextToSpeakUtil.rateNormal);
    }
    else {
      _audioPlayerUtil.playFromUrl(LoadDataUtil.loadSound(soundUrl));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///Hộp âm thanh --------------------------------------------------------
        SizedBox(
            child: widget.quizz.showSoundBox //-> Ẩn hiện theo loại quizz
                ? WdgButton(
                    onTap: () => _speak(widget.quizz.answerCorrect),
                    borderRadius: BorderRadius.circular(12),
                    buttonFit: ButtonFit.scaleDown,
                    color: Theme.of(context).primaryColor,
                    child: Icon(Icons.volume_up,
                        size: orientation == Orientation.portrait
                            ? maxHeight * 0.066
                            : maxHeight * 0.088))
                : null),

        ///Danh sách đáp án ----------------------------------------------------
        Expanded(
          child: Wrap(
            direction: orientation == Orientation.portrait
                ? Axis.horizontal
                : Axis.vertical,
            spacing: 10,
            runSpacing: 10,
            runAlignment: WrapAlignment.center,
            children: widget.quizz.answers.map((key) {
              final bool isSelected = key == selectedKey;
              return SizedBox(
                height: isPortrait
                    ? maxHeight / 5
                    : maxHeight * 2 / 3,
                width: isPortrait
                    ? maxWidth / 2 - 30
                    : maxWidth / 5,
                child: WdgButton(
                  onTap: () {
                    setState(() {
                      selectedKey = key;
                      widget.status.isAnswered.value = true;
                      widget.status.isCorrect =
                          widget.quizz.answersCorrect[key];
                      widget.quizz.showSoundBox ? null : _speak(key);
                    });
                  },
                  buttonFit: ButtonFit.scaleDown,
                  borderRadius: BorderRadius.circular(20),
                  color: VipColors.onPrimary(context),
                  alpha: isSelected ? 100 : 10,
                  child: widget.quizz.showSoundBox
                      ? Center(
                          child: Text(
                            key,
                            style: const TextStyle(
                                fontSize: 20),
                          ),
                        )
                      : const Center(child: Icon(Icons.volume_up, size: 50)),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    ));
  }
}