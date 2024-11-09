import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';

import '../../other/button.dart';

class WdgQuizzResult extends StatelessWidget {
  final QuizzResult quizzResult;
  const WdgQuizzResult({super.key, required this.quizzResult});

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisSize: MainAxisSize.max,
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
                height: 50,
                width: 400,
                margin: const EdgeInsets.only(right: 50, left: 50, bottom: 30),
                child: WdgButton(
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
    );
  }

  Widget _buildSkillResult(String skill, int total, int correct) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$skill:',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Text('Total: $total, Correct: $correct'),
        const SizedBox(height: 8),
      ],
    );
  }
}
