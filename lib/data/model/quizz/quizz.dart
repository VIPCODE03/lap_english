
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
  static List<Quizz> generateQuizzVocabulary({required QuizzMode mode, required List<MdlWord> words}) {
    List<Quizz> quizzes = [];
    List<Quizz<MdlWord>> quizzList;

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

  static List<Quizz> generateQuizzSentence({required QuizzMode mode, required List<MdlSentence> sentences}) {
    List<Quizz> quizzes = [];
    List<Quizz<MdlSentence>> quizzList;

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

class QuizzResult {
  bool isLearned;
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

  QuizzResult(this.total, this.totalWrite, this.totalListen, this.totalRead, this.totalSpeak, this.isLearned, this.type);

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
}

enum TypeQuizz {
  quizzVocabulary, quizzSentence, quizzCustom
}