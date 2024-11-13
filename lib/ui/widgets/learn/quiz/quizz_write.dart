import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz/quizz_write.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizz_widget.dart';
import 'package:lap_english/ui/widgets/other/button.dart';

import '../../other/key_broad.dart';

class WdgQuizzWrite extends WdgQuizz<QuizzWrite> {
  WdgQuizzWrite({super.key, required super.quizz});

  @override
  WdgQuizzState<QuizzWrite, WdgQuizz<QuizzWrite>> createState() =>
      _WdgQuizzWriteWordState();
}

class _WdgQuizzWriteWordState extends WdgQuizzState<QuizzWrite, WdgQuizzWrite> {
  late List<String> userInput;
  double maxHeight = 0;
  double maxWidth = 0;

  @override
  void initState() {
    super.initState();
    userInput = List<String>.filled(widget.quizz.answerCorrect.length, '');
  }

  @override
  Widget build(BuildContext context) {
    maxHeight = MediaQuery.of(context).size.height;
    maxWidth = MediaQuery.of(context).size.width;
    var isVertical = maxHeight > maxWidth;

    return SizedBox(
      height: maxHeight,
      child: Column(
        children: [
          Expanded(
            child: Center(
              ///Row hàng text đáp án --------------------------------------
              child: Wrap(
                children:
                    List.generate(widget.quizz.answerCorrect.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Column(
                      children: [
                        Text(
                          userInput[index].isNotEmpty ? userInput[index] : '_',
                          style: TextStyle(
                              color: userInput[index].isEmpty
                                  ? Theme.of(context).primaryColor
                                  : null,
                              fontSize: 30),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),

          SizedBox(height: maxHeight * 0.01),

          /// Bàn phím ảo -------------------------------------------------
          WdgKeyBroad(
            maxLength: widget.quizz.answerCorrect.length,
            suggest: widget.quizz.answerCorrect,
              onValueChanged: (value) {
                _updateUserInput(value.toLowerCase());
          }),
        ],
      ),
    );
  }

  //=== set text đáp án ===
  void _updateUserInput(String text) {
    setState(() {
      //--- Lấy độ dài  ---
      final length =
          text.length < userInput.length ? text.length : userInput.length;

      //--- Thêm chữ  ---
      for (int i = 0; i < length; i++) {
        userInput[i] = text[i];
      }

      //--- Xóa chữ ---
      for (int i = length; i < userInput.length; i++) {
        userInput[i] = '';
      }

      setStatus(text);
    });
  }

  //=== set trạng thái  ===
  void setStatus(String answer) {
    if (answer.length < widget.quizz.answerCorrect.length) {
      widget.status.isAnswered.value = false;
    } else {
      widget.status.isAnswered.value = true;
      widget.status.isCorrect =
          answer.toLowerCase().trim() == widget.quizz.answerCorrect;
      widget.status.correctAnswer = widget.quizz.answerCorrect;
    }
  }
}
