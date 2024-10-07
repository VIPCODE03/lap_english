
import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz.dart';
import 'package:lap_english/data/model/sentence.dart';
import 'package:lap_english/data/model/vocabulary.dart';
import 'package:lap_english/ui/screens/quizz_screen.dart';
import '../widgets/learn/quiz/quizzes.dart';

class LearnScreen extends StatelessWidget {
  late List<Word>? _words;
  late List<Sentence>? _sentences;
  late final Learn _learn;
  late final String _title;
  late final List<Quizz> _quizzes;

  LearnScreen.vocabulary({super.key, required List<Word> words})
      : _learn = Learn.vocabulary,
        _title = "Học từ vựng",
        _words = words;

  LearnScreen.sentence({super.key, required List<Sentence> sentences})
      : _learn = Learn.sentence,
        _title = "Học câu",
        _sentences = sentences;

  @override
  Widget build(BuildContext context) {
    _createQuizz();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(_title)),
      body: QuizzScreen(children: QuizzItems.create(context, _quizzes))
    );
  }

  void _createQuizz() {
    switch(_learn) {
      case Learn.vocabulary:
        _quizzes = Quizzes.createQuizzVocabulary(mode: QuizzMode.basic, words: _words!);
      case Learn.sentence:
        _quizzes = Quizzes.createQuizzSentence(mode: QuizzMode.basic, sentences: _sentences!);
    }
  }
}

enum Learn {
  vocabulary,
  sentence,
}