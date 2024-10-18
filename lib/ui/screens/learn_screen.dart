
import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz.dart';
import 'package:lap_english/data/model/sentence.dart';
import 'package:lap_english/data/model/vocabulary.dart';
import 'package:lap_english/ui/screens/quizz_screen.dart';
import '../widgets/learn/quiz/quizzes.dart';

class LearnScreen extends StatelessWidget {
  final String _title;
  final List<Quizz> _quizzes;

  LearnScreen.vocabulary({super.key, required List<Word> words})
      : _title = "Học từ vựng",
        _quizzes = Quizzes.generateQuizzVocabulary(mode: QuizzMode.basic, words: words);

  LearnScreen.sentence({super.key, required List<Sentence> sentences})
      : _title = "Học câu",
        _quizzes = Quizzes.generateQuizzSentence(mode: QuizzMode.basic, sentences: sentences);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(_title)),
      body: QuizzScreen(children: QuizzItems.create(context, _quizzes))
    );
  }
}

