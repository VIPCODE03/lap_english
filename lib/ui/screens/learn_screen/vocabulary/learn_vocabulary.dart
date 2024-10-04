
import 'package:flutter/material.dart';
import 'package:lap_english/constant/quizz_constant.dart';
import 'package:lap_english/data/model/quizz.dart';
import 'package:lap_english/data/model/vocabulary.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quizz_page.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quiz_vocabulary/quizz_choose_one_word.dart';

class LearnVocabularyScreen extends StatelessWidget {
  final List<Word> words;
  final int _mode;

  const LearnVocabularyScreen.normal({super.key, required this.words}) : _mode = 1;

  const LearnVocabularyScreen.advanced({super.key, required this.words}) : _mode = 2;

  @override
  Widget build(BuildContext context) {
    var quizz = Quizzes.createQuizzVocabulary(QuizzConstant.quizzesVocabulary(), words);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Học Từ Vựng'),
      ),
      body: QuizzPage(children: QuizzVocabularys.create(context, quizz))

    );
  }
}