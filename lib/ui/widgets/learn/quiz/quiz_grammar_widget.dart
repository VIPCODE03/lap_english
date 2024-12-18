import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz/quiz_grammar.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizz_widget.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizzes_widget.dart';
import 'package:lap_english/ui/widgets/other/special_text.dart';

import '../../../themes/size.dart';
import '../../other/dashed_border.dart';

class WdgQuizGrammar extends WdgQuizz<MdlQuizGrammar> {
  WdgQuizGrammar({super.key, required super.quizz});

  @override
  WdgQuizzState<MdlQuizGrammar, WdgQuizz<MdlQuizGrammar>> createState()
  => _WdgQuizGrammarState();
}

class _WdgQuizGrammarState extends WdgQuizzState<MdlQuizGrammar, WdgQuizGrammar>  {
  late WdgQuizz wdgQuiz;
  late List<Widget> quizGrammar;
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

    hasChanged.addListener(updateScreen);
  }

  @override
  void dispose() {
    super.dispose();
    hasChanged.removeListener(updateScreen);
  }

  void updateScreen() {
    setState(() {});
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
            top: _isAtTop ? 0 : (isPortrait || isTablet) ? maxHeight / 5 : maxHeight / 10,
            left: _isAtTop ? (isPortrait || isTablet) ? 0 : maxWidth / 1.66 : 0,
            right: 0,
            child: _item()
        ),

        Column(
          children: [
            if(isPortrait || isTablet)
              Opacity(
                  opacity: 0,
                  child: SizedBox(
                    width: maxWidth,
                    child: _item(),
                  )
              ),

            Expanded(
              child: Row(
                children: [
                  Expanded(child:AnimatedOpacity(
                    opacity: _isAtTop ? 1 : 0,
                    duration: const Duration(milliseconds: 666),
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 333),
                      onEnd: () => wdgQuiz.status.isStarted.value = true,
                      scale: _isAtTop ? 1 : 0,
                      child: Align(alignment: Alignment.center, child: wdgQuiz),
                    ),
                  )),

                  if(!isPortrait && !isTablet)
                    Opacity(
                      opacity: 0,
                      child: SizedBox(
                        width: maxWidth - maxWidth / 1.66,
                        child: _item(),
                      )
                    ),
                ],
              )
            ),
          ],
        )
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.quizz.structure.description,
              style: TextStyle(fontSize: textSize.special),
            ),

            WdgDashedBorder(
                color: VipColors.primary(context),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  child: WdgSpecialText(text: widget.quizz.structure.structure, size: textSize.special),
                )
            )
          ],
        )
    );
  }
}
