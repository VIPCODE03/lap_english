/*  Quizz trắc nghiệm 2-4 đáp án  */
import 'package:flutter/material.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import '../../../../../data/model/quizz/quizz_vocabulary.dart';
import '../../../../../utils/text_to_speak.dart';
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

    //--- Phát âm thanh ---
    widget.status.isStarted.addListener(() {
      if(widget.status.isStarted.value) {
        _textToSpeakUtil.speak(widget.quizz.correctWord!, TextToSpeakUtil.languageAU, TextToSpeakUtil.rateNormal);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Hộp âm thanh --------------------------------------------------------
        const SizedBox(height: 20),
        SizedBox(
          child: widget.quizz.isHidden //-> Ẩn hiện theo loại quizz
              ? null
              : WdgButton(
                onTap: () => _textToSpeakUtil.speak(
                    widget.quizz.correctWord!,
                    TextToSpeakUtil.languageAU,
                    TextToSpeakUtil.rateNormal
                ),
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).primaryColor,
                child: const Icon(Icons.volume_up, size: 40),
          ),
        ),

        ///Danh sách đáp án ----------------------------------------------------
        const SizedBox(height: 20),
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 50,
            padding: const EdgeInsets.all(20),
            children: widget.quizz.answers.keys.map((key) {
              final bool isSelected = key == selectedKey; //->  Kiểm tra trạng thái
              return WdgButton(
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
                borderRadius: BorderRadius.circular(20),
                color: isSelected 
                    ? Theme.of(context).primaryColor.withAlpha(100)
                    : Theme.of(context).primaryColor.withAlpha(50)
                ,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: isSelected
                        ? Border.all(color: Theme.of(context).primaryColor.withAlpha(50), width: 4)
                        : null,
                    boxShadow: isSelected
                        ? [
                      BoxShadow(
                        color: Theme.of(context).primaryColor.withAlpha(50),
                        offset: const Offset(1, 5),
                        blurRadius: 10,
                      )
                    ]
                        : null,
                  ),
                  child: widget.quizz.isHidden
                        ? const Center(child: Icon(
                      Icons.volume_up, size: 50))
                        : Center(child: Text(key, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}