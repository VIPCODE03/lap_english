import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz/quizz_choose_one.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizz_widget.dart';
import '../../../themes/size.dart';
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
  void initState() {
    super.initState();

    hasChanged.addListener(change);
  }

  change() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    hasChanged.removeListener(change);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double itemHeight = isPortrait ? constraints.maxHeight / 5 : constraints.maxHeight / 2.5;
        double itemWidth = isPortrait ? constraints.maxWidth / 1.1 : constraints.maxWidth / 2.5;

        return Wrap(
          spacing: 10,
          runSpacing: 10,
          direction: isPortrait ? Axis.horizontal : Axis.vertical,
          children: widget.quizz.answers.map((option) {
            bool isCorrect = widget.quizz.answersCorrect[option] ?? false;
            if (isCorrect) widget.status.correctAnswer = option;
            bool isSelected = option == selectedKey;

            return SizedBox(
                height: itemHeight,
                width: itemWidth,

                child: WdgButton(
                  onTap: () {
                    setState(() {
                      selectedKey = option;
                      widget.status.isAnswered.value = true;
                      widget.status.isCorrect = isCorrect;
                    });
                  },
                  color: VipColors.onPrimary(context),
                  alpha: isSelected ? 100 : 10,
                  borderRadius: BorderRadius.circular(12),
                  child: Text(
                        option,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: textSize.special),
                      ),
                ),
            );
          }).toList(),
        );
      }
    );
  }
}
