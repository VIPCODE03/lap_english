import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz/quizz_choose_one.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizz_widget.dart';
import '../../other/button.dart';

/*  Quizz trắc nghiệm 2-4 đáp án  */
class WdgQuizzChooseOne extends WdgQuizz<QuizzChooseOne> {
  WdgQuizzChooseOne({super.key, required super.quizz});

  @override
  WdgQuizzState<QuizzChooseOne, WdgQuizz<QuizzChooseOne>> createState()
    => _WdgQuizzChooseOneState();
}

class _WdgQuizzChooseOneState extends WdgQuizzState<QuizzChooseOne, WdgQuizzChooseOne> {
  String? selectedKey;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: widget.quizz.answers.map((option) {
            bool isCorrect = widget.quizz.answersCorrect[option] ?? false;
            if (isCorrect) widget.status.correctAnswer = option;
            bool isSelected = option == selectedKey;

            return Container(
              constraints: const BoxConstraints(minHeight: 66),
              width: MediaQuery.of(context).size.width - 50,
              child: WdgButton(
                onTap: () {
                  setState(() {
                    selectedKey = option;
                    widget.status.isAnswered.value = true;
                    widget.status.isCorrect = isCorrect;
                  });
                },
                color: isSelected
                    ? Theme.of(context).primaryColor.withAlpha(90)
                    : Theme.of(context).primaryColor.withAlpha(30),
                borderRadius: BorderRadius.circular(12),
                child: Text(
                  option,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
