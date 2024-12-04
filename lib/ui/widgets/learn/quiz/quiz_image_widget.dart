
import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz/quiz_image.dart';
import 'package:lap_english/main.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizz_widget.dart';
import '../../other/button.dart';

/*  Quizz trắc nghiệm 2-4 đáp án  */
class WdgQuizzImage extends WdgQuizz<MdlQuizImage> {
  WdgQuizzImage({super.key, required super.quizz});

  @override
  WdgQuizzState<MdlQuizImage, WdgQuizz<MdlQuizImage>> createState()
  => _WdgQuizzImageState();
}

class _WdgQuizzImageState extends WdgQuizzState<MdlQuizImage, WdgQuizzImage> {
  String? selectedKey;
  bool isImgQuestion = false;

  @override
  void initState() {
    super.initState();
    isImgQuestion = widget.quizz.imgQuestion.isNotEmpty;

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
          double itemHeight = isPortrait ? constraints.maxHeight / 2.5 : constraints.maxHeight;
          double itemWidth = isPortrait ? constraints.maxWidth / 2.5 : constraints.maxWidth / 4.5;

          return Wrap(
            spacing: 10,
            runSpacing: 10,
            direction: isPortrait ? Axis.horizontal : Axis.vertical,
            children: [
              if(isImgQuestion)
                SizedBox(
                  height: isPortrait ? constraints.maxHeight / 3.5 : maxHeight,
                  width: isPortrait ? constraints.maxWidth : constraints.maxWidth / 3.5,
                  child: Image.network(widget.quizz.imgQuestion),
                ),

              ...widget.quizz.answers.map((option) {
                bool isCorrect = widget.quizz.answersCorrect[option] ?? false;
                if (isCorrect) widget.status.correctAnswer = option;
                bool isSelected = option == selectedKey;

                return FittedBox(
                  child: SizedBox(
                    height: isImgQuestion ? null : itemHeight,
                    width: isImgQuestion ? null : itemWidth,

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
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          children: [
                            if(!isImgQuestion)
                              SizedBox(
                                height: itemHeight / 2,
                                width: itemWidth,
                                child: Image.network(widget.quizz.imgAnswer[option]!),
                              ),

                            SizedBox(
                              width: isImgQuestion
                                  ? isPortrait ? constraints.maxWidth : (constraints.maxWidth - constraints.maxWidth / 3.5) - 50
                                  : null,
                              child: Text(
                                option,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: isPortrait ? 18 : isTablet ? 20 : 16),
                              ),
                            )
                          ],
                        )
                    ),
                  ),
                );
              }),
            ]
          );
        }
    );
  }
}
