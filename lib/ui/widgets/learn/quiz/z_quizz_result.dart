import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/ui/widgets/other/progress_bar.dart';
import 'package:lap_english/ui/widgets/other/scaffold.dart';

import '../../other/button.dart';

class WdgQuizzResult extends StatelessWidget {
  final QuizzResult quizzResult;
  const WdgQuizzResult({super.key, required this.quizzResult});

  @override
  Widget build(BuildContext context) {
    return WdgScaffold(body: Column(
      children: [
        Text(
          'Quiz Type: ${quizzResult.type.toString().split('.').last}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        Expanded(child: Column(
          children: [
            const SizedBox(height: 16),
            Text('Total Questions: ${quizzResult.total}'),
            Text('Correct Answers: ${quizzResult.correct}'),
            const SizedBox(height: 16),
            _buildSkillResult('Reading', quizzResult.totalRead, quizzResult.correctRead),
            _buildSkillResult('Writing', quizzResult.totalWrite, quizzResult.correctWrite),
            _buildSkillResult('Listening', quizzResult.totalListen, quizzResult.correctListen),
            _buildSkillResult('Speaking', quizzResult.totalSpeak, quizzResult.correctSpeak),
            const SizedBox(height: 16),
            Text(
              'Highest Correct Streak: ${quizzResult.correctConsecutive}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        )),

        Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width - 50,
            margin: const EdgeInsets.only(bottom: 15),
            child: WdgButton(
              buttonFit: ButtonFit.scaleDown,
              onTap: () {
                Navigator.pop(context, quizzResult);
              },
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).primaryColor,
              child: const Text(
                'Hoàn thành',
                style: TextStyle(fontSize: 20),
              ),
            )),
      ],
    ));
  }

  Widget _buildSkillResult(String skill, int total, int correct) {
    double progress = total > 0 ? correct / total : 0;
    return total > 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$skill:',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
}
