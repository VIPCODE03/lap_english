import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz/quiz_grammar.dart';
import 'package:lap_english/main.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizz_widget.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizzes_widget.dart';
import 'package:lap_english/ui/widgets/other/special_text.dart';

import '../../other/dashed_border.dart';

class WdgQuizGrammar extends WdgQuizz<MdlQuizGrammar> {
  WdgQuizGrammar({super.key, required super.quizz});

  @override
  WdgQuizzState<MdlQuizGrammar, WdgQuizz<MdlQuizGrammar>> createState()
  => _WdgQuizGrammarState();
}

class _WdgQuizGrammarState extends WdgQuizzState<MdlQuizGrammar, WdgQuizGrammar>  {
  late WdgQuizz wdgQuiz;
  bool _isAtTop = false;

  @override
  void initState() {
    super.initState();
    initQuiz();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isAtTop = true;
      });
    });
  }

  void initQuiz() {
    wdgQuiz = WdgQuizzes.generate(widget.quizz.quiz);
    wdgQuiz.status.isAnswered.addListener(() {
      widget.status.isAnswered.value = wdgQuiz.status.isAnswered.value;
    });

    widget.status.isChecked.addListener(() {
      widget.status.isCorrect = wdgQuiz.status.isCorrect;
      widget.status.correctAnswer = wdgQuiz.status.correctAnswer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
            duration: const Duration(milliseconds: 333),
            top: _isAtTop ? 0 : maxHeight / 3,
            left: 0,
            right: 0,
            child: _item()
        ),

        Column(
          children: [
            Opacity(
                opacity: 0,
                child: _item()
            ),

            Expanded(
              child: AnimatedOpacity(
                opacity: _isAtTop ? 1 : 0,
                duration: const Duration(milliseconds: 666),
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 333),
                  onEnd: () => wdgQuiz.status.isStarted.value = true,
                  scale: _isAtTop ? 1 : 0,
                  child: wdgQuiz,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Item cấu trúc ngữ pháp  -------------------------------------------------
  Widget _item() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: VipColors.onPrimary(context),
                width: 1
            )
        ),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              widget.quizz.structure.description,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 10),

            WdgDashedBorder(
                color: VipColors.primary(context),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  child: WdgSpecialText(text: widget.quizz.structure.structure),
                )
            )
          ],
        )
    );
  }
}
