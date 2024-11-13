import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz/quizz_sound_choose_one.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizz_widget.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import '../../../../../utils/text_to_speak.dart';
import '../../../../main.dart';

class WdgQuizzSoundChooseOne extends WdgQuizz<QuizzSoundChooseOne> {
  WdgQuizzSoundChooseOne({super.key, required super.quizz});

  @override
  WdgQuizzState<QuizzSoundChooseOne, WdgQuizz<QuizzSoundChooseOne>> createState()
  => _WdgQuizzSoundChooseOneState();
}

class _WdgQuizzSoundChooseOneState extends WdgQuizzState<QuizzSoundChooseOne, WdgQuizzSoundChooseOne> {
  final TextToSpeakUtil _textToSpeakUtil = TextToSpeakUtil();
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
  }

  @override
  void dispose() {
    super.dispose();
    _textToSpeakUtil.dispose();
  }

  //=== Speak ===
  Future<void> _speak(String text) async {
    _textToSpeakUtil.speak(text, TextToSpeakUtil.languageAU, TextToSpeakUtil.rateNormal);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    child:  Icon(Icons.volume_up, size: orientation == Orientation.portrait ? maxHeight * 0.066 : maxWidth * 0.055)
                  )
                : null),

        ///Danh sách đáp án ----------------------------------------------------
        Expanded(
            child: Wrap(
              direction: orientation == Orientation.portrait ? Axis.horizontal : Axis.vertical,
              spacing: 10,
              runSpacing: 10,
              runAlignment: WrapAlignment.center,
              children: widget.quizz.answers.map((key) {
                final bool isSelected = key == selectedKey;
                return SizedBox(
                  height: orientation == Orientation.portrait ? maxHeight / 5 : maxHeight * 2/3,
                  width: orientation == Orientation.portrait ? maxWidth / 2 - 30 : maxWidth / 5,
                  child: WdgButton(
                    onTap: () {
                      setState(() {
                        selectedKey = key;
                        widget.status.isAnswered.value = true;
                        widget.status.isCorrect = widget.quizz.answersCorrect[key];
                        widget.quizz.showSoundBox ? null : _speak(key);
                      });
                    },
                    buttonFit: ButtonFit.scaleDown,
                    borderRadius: BorderRadius.circular(20),
                    color: isSelected
                        ? Theme.of(context).primaryColor.withAlpha(100)
                        : Theme.of(context).primaryColor.withAlpha(50),
                    child: widget.quizz.showSoundBox
                        ? Center(
                      child: Text(
                        key,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                        : const Center(child: Icon(Icons.volume_up, size: 50)),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}