import 'package:flutter/cupertino.dart';
import 'package:lap_english/data/model/quizz/quiz_letter_count.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizz_widget.dart';
import 'package:lap_english/ui/widgets/other/button.dart';

import '../../../themes/size.dart';

class WdgQuizLetterCount extends WdgQuizz<QuizLetterCount> {

  WdgQuizLetterCount({super.key, required super.quizz});

  @override
  WdgQuizzState<QuizLetterCount, WdgQuizz<QuizLetterCount>> createState() => _WdgQuizLetterCountState();
}

class _WdgQuizLetterCountState extends WdgQuizzState<QuizLetterCount, WdgQuizLetterCount> {
  String? select;
  bool checked = false;
  
  @override
  void initState() {
    super.initState();
    hasChanged.addListener(change);
    widget.status.isChecked.addListener(_checked);
    widget.status.correctAnswer = '<${widget.quizz.answerCorrect}> với <${widget.quizz.answerCorrect.length}> kí tự';
  }

  change() {
    setState(() {});
  }

  _checked() {
    setState(() {
      checked = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
    hasChanged.removeListener(change);
    widget.status.isChecked.removeListener(_checked);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, contrains) {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: VipColors.onPrimary(context)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...widget.quizz.charDisplay.keys.map((key)
                => widget.quizz.charDisplay[key]!
                    ? Text(key, style: TextStyle(fontSize: textSize.medium))
                    : AnimatedScale(
                        scale: !checked ? 0.6 : 1,
                        duration: const Duration(milliseconds: 111),
                        child: Text(
                          checked ? key : ' ... ',
                          style: TextStyle(fontSize: textSize.medium, color: VipColors.text(context)),
                      )),
                )
              ],
            ),
          ),

          Expanded(
              child: Center(child: Wrap(
                runSpacing: 6,
                spacing: 6,
                children: [
                  ...widget.quizz.answers.map((option) {
                    return SizedBox(
                        height: contrains.maxHeight / 3,
                        width: contrains.maxWidth / 2.5,
                        child: WdgButton(
                            onTap: () {
                              setState(() {
                                select = option;
                                widget.status.isAnswered.value = true;
                                widget.status.isCorrect = option == widget.quizz.answerCorrect;
                              });
                            },
                            alpha: (select == option) ? 100 : 10,
                            color: VipColors.onPrimary(context),
                            borderRadius: BorderRadius.circular(12),
                            child: Text('${option.length}', style: TextStyle(fontSize: textSize.medium),))
                    );})
                ],
              ))
          )
        ],
      );
    });
  }
}