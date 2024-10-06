
import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz.dart';
import 'package:lap_english/data/model/vocabulary.dart';
import 'package:lap_english/ui/screens/quizz_screen.dart';
import '../../../widgets/learn/quiz/quizzes.dart';

class LearnVocabularyScreen extends StatelessWidget {
  final List<Word> words;
  final int _mode;

  const LearnVocabularyScreen.normal({super.key, required this.words}) : _mode = 1;

  const LearnVocabularyScreen.advanced({super.key, required this.words}) : _mode = 2;

  @override
  Widget build(BuildContext context) {
    var quizz = Quizzes.createQuizzVocabulary(mode: QuizzMode.basic, words: words);
    return Scaffold(resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Học Từ Vựng1 '),
      ),
      body: QuizzPage(children: QuizzVocabularys.create(context, quizz))

    );
  }
}