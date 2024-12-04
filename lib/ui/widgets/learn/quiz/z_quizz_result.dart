import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/main.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/widgets/other/progress_bar.dart';
import 'package:lap_english/ui/widgets/other/scaffold.dart';

import '../../other/button.dart';

class WdgQuizzResult extends StatelessWidget {
  final QuizzResult quizzResult;

  const WdgQuizzResult({super.key, required this.quizzResult});

  @override
  Widget build(BuildContext context) {
    return WdgScaffold(
        body: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + 25),
                Text(
                  _getNameQuiz(quizzResult.type),
                  style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: VipColors.text(context)
                  ),
                ),
                Expanded(child: Column(
                  children: [
                    Text(
                      'Đúng liên tiếp: ${quizzResult.correctConsecutive}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 16),
                    _buildSkillResult('Reading', quizzResult.totalRead,
                        quizzResult.correctRead),
                    _buildSkillResult('Writing', quizzResult.totalWrite,
                        quizzResult.correctWrite),
                    _buildSkillResult('Listening', quizzResult.totalListen,
                        quizzResult.correctListen),
                    _buildSkillResult('Speaking', quizzResult.totalSpeak,
                        quizzResult.correctSpeak),
                  ],
                )),
                Container(
                    height: maxHeight * 0.07,
                    width: maxWidth - 50,
                    margin: const EdgeInsets.only(bottom: 15),
                    child: WdgButton(
                      buttonFit: ButtonFit.scaleDown,
                      onTap: () {
                        Navigator.pop(context, quizzResult);
                      },
                      borderRadius: BorderRadius.circular(12),
                      color: VipColors.primary(context),
                      child: const Text(
                        'Hoàn thành',
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
              ],
            )));
  }

  /// Item skill  ------------------------------------------------------------
  Widget _buildSkillResult(String skill, int total, int correct) {
    double progress = total > 0 ? correct / total : 0;
    return total > 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                skill,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
                child: WdgAnimatedProgressBar(
                  value: progress,
                  label: '${(progress * 100).toStringAsFixed(0)}%',
                ),
              ),
              const SizedBox(height: 8),
            ],
          )
        : const SizedBox.shrink();
  }

  //=== Lấy tên quiz  ===
  String _getNameQuiz(TypeQuizz typeQuiz) {
    return switch(typeQuiz) {
      TypeQuizz.quizzVocabulary => "Quiz từ vựng",

      TypeQuizz.quizzSentence => "Quiz câu",

      TypeQuizz.quizzCustom => throw UnimplementedError(),

      TypeQuizz.quizGrammar => "Quiz ngữ pháp",
    };
  }
}
