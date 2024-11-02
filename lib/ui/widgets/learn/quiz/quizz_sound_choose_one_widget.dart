import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz/quizz_sound_choose_one.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizz_widget.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import '../../../../../utils/text_to_speak.dart';

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
      if(widget.status.isStarted.value) {
        _speak(widget.quizz.answerCorrect);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _textToSpeakUtil.dispose();
  }

  Future<void> _speak(String text) async {
    _textToSpeakUtil.speak(text, TextToSpeakUtil.languageAU, TextToSpeakUtil.rateNormal);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Hộp âm thanh --------------------------------------------------------
        const SizedBox(height: 20),
        SizedBox(
          child: widget.quizz.showSoundBox //-> Ẩn hiện theo loại quizz
              ? null
              : WdgButton(
                  onTap: () => _speak(widget.quizz.answerCorrect),
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).primaryColor,
                  child: const Icon(Icons.volume_up, size: 50),
                ),
        ),

        ///Danh sách đáp án ----------------------------------------------------
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5 - 10,
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: widget.quizz.answers.length,
              itemBuilder: (context, index) {
                final key = widget.quizz.answers[index];
                final bool isSelected = key == selectedKey;
                return WdgButton(
                  onTap: () {
                    setState(() {
                      selectedKey = key;
                      widget.status.isAnswered.value = true;
                      widget.status.isCorrect = widget.quizz.answersCorrect[key];
                      widget.quizz.showSoundBox ? _speak(key) : null;
                    });
                  },
                  borderRadius: BorderRadius.circular(20),
                  color: isSelected
                      ? Theme.of(context).primaryColor.withAlpha(100)
                      : Theme.of(context).primaryColor.withAlpha(50),
                  child: widget.quizz.showSoundBox
                      ? const Center(child: Icon(Icons.volume_up, size: 50))
                      : Center(
                          child: Text(
                            key,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}