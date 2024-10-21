
import 'dart:core';

import 'package:lap_english/data/model/quizz.dart';
import 'package:lap_english/data/model/sentence.dart';
import 'package:lap_english/data/model/skill.dart';

abstract class QuizzSentence extends Quizz {
  late List<Sentence> _sentences;
  set sentences(List<Sentence> sentences) => _sentences = sentences;

  @override
  List<Quizz> generate() => generateQuizzSentence(_sentences);

  List<QuizzSentence> generateQuizzSentence(List<Sentence> sentences);
}

class QuizzSentenceChoose extends QuizzSentence {
  @override
  List<QuizzSentence> generateQuizzSentence(List<Sentence> sentences) {
    List<QuizzSentenceChoose> quizzes = [];

    for(var sentence in sentences) {
      var quizzChoose = QuizzSentenceChoose();
      quizzChoose.question = "Chọn bản dịch nghĩa của câu <${sentence.sentence}>";
      quizzChoose.answers = {};

      List<Sentence> answers = [sentence];
      List<Sentence> copy = List.from(sentences)..remove(sentence);
      copy.shuffle();
      answers.addAll(copy.take(2).toList());
      answers.shuffle();

      for(var s in answers) {
        quizzChoose.answers[s.translation] = s == sentence;
      }
      quizzes.add(quizzChoose);
    }

    return quizzes;
  }

  @override
  SkillType get skillType => SkillType.reading;
}