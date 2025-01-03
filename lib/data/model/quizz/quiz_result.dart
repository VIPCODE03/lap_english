import 'dart:math';

import 'package:lap_english/data/model/quizz/quizz.dart';

import '../learn/grammar.dart';
import '../learn/word_sentence.dart';
import '../user/skill.dart';

class QuizzResult {
  bool isLearned = Random().nextBool();
  int idObject = 0;
  TypeQuizz type;

  int total;
  int totalSpeak;
  int totalListen;
  int totalRead;
  int totalWrite;

  int correct = 0;
  int correctSpeak = 0;
  int correctListen = 0;
  int correctWrite = 0;
  int correctRead = 0;
  int correctConsecutive = 0;

  int bonus = 5;
  int pointRank = 0;

  int totalWord;
  int totalSentence;
  int totalGrammar;

  QuizzResult(
      this.total,
      this.totalWrite,
      this.totalListen,
      this.totalRead,
      this.totalSpeak,
      this.type,
      this.totalWord,
      this.totalSentence,
      this.totalGrammar,
      {required dynamic object}) {

    if(object is SubTopic) {
      idObject = object.id;
    }

    else if(object is Grammar) {
      idObject = object.id;
    }

    else {
      idObject = 0;
    }
  }

  //=== Cập nhật kết quả  ===
  void update(bool isCorrect, SkillType skill, int newCorrectConsecutive) {
    if(isCorrect) {
      correct++;
      if(correctConsecutive < newCorrectConsecutive) correctConsecutive = newCorrectConsecutive;

      switch(skill) {
        case SkillType.reading:
          correctRead++; break;
        case SkillType.writing:
          correctWrite++; break;
        case SkillType.listening:
          correctListen++; break;
        case SkillType.speaking:
          correctSpeak++; break;
      }
    }
  }

  //=== Lấy tên quiz  ===
  String get nameQuiz => switch(type) {
    TypeQuizz.quizzVocabulary => "Quiz từ vựng",

    TypeQuizz.quizzSentence => "Quiz câu",

    TypeQuizz.quizzCustom => "Quiz",

    TypeQuizz.quizGrammar => "Quiz ngữ pháp",
  };

  Map<String, dynamic> toMap() {
    return {
      'isLearned': isLearned,
      'idObject': idObject,
      'type': type.toString(),
      'total': total,
      'totalSpeak': totalSpeak,
      'totalListen': totalListen,
      'totalRead': totalRead,
      'totalWrite': totalWrite,
      'correct': correct,
      'correctSpeak': correctSpeak,
      'correctListen': correctListen,
      'correctWrite': correctWrite,
      'correctRead': correctRead,
      'correctConsecutive': correctConsecutive,
      'bonus': bonus,
      'pointRank': pointRank,
      'totalWord': totalWord,
      'totalSentence': totalSentence,
      'totalGrammar': totalGrammar,
    };
  }
}
