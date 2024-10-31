
import 'package:lap_english/constant/quizz_constant.dart';
import 'package:lap_english/data/model/learn/sentence.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';

import '../user/skill.dart';

/*  Class quizz trừu tượng  */
abstract class Quizz<T> {
  late final List<T> datas;
  String question = "";
  List<String> answers = [];
  String answerCorrect = "";
  Map<String, bool> answersCorrect = {};

  SkillType get skillType;

  List<Quizz> generate();
}

/*  Class khởi tạo các loại quizz   */
class Quizzes {
  static List<Quizz> generateQuizzVocabulary({required QuizzMode mode, required List<Word> words}) {
    List<Quizz> quizzes = [];
    List<Quizz<Word>> quizzList;

    switch(mode) {
      case QuizzMode.basic:
        quizzList = QuizzConstant.quizzesVocabularyBasic();
        break;
      case QuizzMode.custom:
        quizzList = QuizzConstant.quizzesVocabularyBasic();
        break;
    }

    for(var quizz in quizzList) {
      quizz.datas = words;
      quizzes.addAll(quizz.generate());
    }
    return quizzes;
  }

  static List<Quizz> generateQuizzSentence({required QuizzMode mode, required List<Sentence> sentences}) {
    List<Quizz> quizzes = [];
    List<Quizz<Sentence>> quizzList;

    switch(mode) {
      case QuizzMode.basic:
        quizzList = QuizzConstant.quizzesSentenceBasic();
        break;
      case QuizzMode.custom:
        quizzList = QuizzConstant.quizzesSentenceBasic();
        break;
    }

    for(var quizz in quizzList) {
      quizz.datas = sentences;
      quizzes.addAll(quizz.generate());
    }
    return quizzes;
  }
}

/*  Chế độ quizz  */
enum QuizzMode {
  basic,
  custom
}