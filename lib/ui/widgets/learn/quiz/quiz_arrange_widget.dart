import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz/quiz_arrange.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/themes/size.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizz_widget.dart';

class WdgQuizArrange extends WdgQuizz<QuizArrange> {
  WdgQuizArrange({super.key, required super.quizz});

  @override
  WdgQuizzState<QuizArrange, WdgQuizz<QuizArrange>> createState() => _WdgQuizArrangeState();
}

class _WdgQuizArrangeState extends WdgQuizzState<QuizArrange, WdgQuizArrange> {

  @override
  void initState() {
    super.initState();
    hasChanged.addListener(_update);
  }

  void _update() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    hasChanged.removeListener(_update);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        width: widget.quizz.answers.length * 1.15 * (widget.quizz.answers.length > 5 && isPortrait && !isTablet
            ? (maxWidth - 66) / widget.quizz.answers.length
            : 50
        ),
        child: ReorderableListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.quizz.answers.length,
          itemBuilder: (context, index) {
            return ReorderableDragStartListener(
              key: ValueKey(index),
              index: index,
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 50
                ),
                width: (maxWidth - 66) / widget.quizz.answers.length,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: VipColors.onPrimary(context)
                ),
                alignment: Alignment.center,
                child: Text(
                  widget.quizz.answers[index],
                  style: TextStyle(color: Colors.white, fontSize: textSize.medium),
                ),
              ),
            );
          },
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final item = widget.quizz.answers.removeAt(oldIndex);
              widget.quizz.answers.insert(newIndex, item);
              widget.status.isAnswered.value = true;
              String aw = '';
              for(var char in widget.quizz.answers) {
                aw += char;
              }
              widget.status.isCorrect = aw == widget.quizz.answerCorrect;
            });
          },
        ),
    );
  }
}