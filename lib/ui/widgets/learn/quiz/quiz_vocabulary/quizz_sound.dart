/*  Quizz trắc nghiệm 2-4 đáp án  */
import 'package:flutter/material.dart';

import '../../../../../data/model/quizz/quizz_vocabulary.dart';
import '../../../../../utils/text_to_maptext.dart';
import '../../../../../utils/text_to_speak.dart';
import '../../../other/rich_text.dart';
import '../quizz_widget.dart';

/*  Quizz chọn âm thanh */
class WdgQuizzSoundOfWord extends WdgQuizz<QuizzSoundOfWord> {
  WdgQuizzSoundOfWord({super.key, required super.quizz});

  @override
  WdgQuizzState<QuizzSoundOfWord, WdgQuizz<QuizzSoundOfWord>> createState() => _WdgQuizzSoundOfWordState();

}

class _WdgQuizzSoundOfWordState extends WdgQuizzState<QuizzSoundOfWord, WdgQuizzSoundOfWord> {
  final TextToSpeakUtil _textToSpeakUtil = TextToSpeakUtil();
  String? selectedKey; //-> Biến lưu item được chọn

  @override
  void initState() {
    super.initState();

    //--- Nói câu hỏi ---
    if(!widget.quizz.isHidden) {
      Future.delayed(const Duration(milliseconds: 1000)).then((_) {
        _textToSpeakUtil.speak(
            widget.quizz.correctWord!,
            TextToSpeakUtil.languageUK,
            TextToSpeakUtil.rateNormal
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///AdaptiveText câu hỏi ------------------------------------------------
        WdgAdaptiveText(texts: parseStringToMap(widget.quizz.question)),

        ///Hộp âm thanh --------------------------------------------------------
        const SizedBox(height: 20),
        SizedBox(
          child: widget.quizz.isHidden //-> Ẩn hiện theo loại quizz
              ? null
              : GestureDetector(
                onTap: () => _textToSpeakUtil.speak(
                    widget.quizz.correctWord!,
                    TextToSpeakUtil.languageUK,
                    TextToSpeakUtil.rateNormal
                ),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: const Icon(Icons.volume_up),
                ),
          ),
        ),

        ///Danh sách đáp án ----------------------------------------------------
        const SizedBox(height: 20),
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children: widget.quizz.answers.keys.map((key) {
              final bool isSelected = key == selectedKey; //->  Kiểm tra trạng thái
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedKey = key; //-> Cập nhật item được chọn
                    widget.status.isAnswered.value = true;
                    widget.status.isCorrect = widget.quizz.answers[key];
                    widget.quizz.isHidden
                        ? _textToSpeakUtil.speak(key, TextToSpeakUtil.languageUK, TextToSpeakUtil.rateNormal)
                        : null;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: isSelected
                        ? Border.all(color: Theme.of(context).primaryColor, width: 4)
                        : null,
                    boxShadow: isSelected
                        ? [
                      BoxShadow(
                        color: Theme.of(context).primaryColor,
                        offset: const Offset(1, 5),
                        blurRadius: 10,
                      )
                    ]
                        : null,
                  ),
                  child: Card(
                    child: widget.quizz.isHidden
                        ? const Center(child: Icon(Icons.volume_up))
                        : Center(child: Text(key)),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}