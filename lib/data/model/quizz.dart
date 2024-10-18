
import 'package:lap_english/constant/quizz_constant.dart';
import 'package:lap_english/data/model/quizz_sentence.dart';
import 'package:lap_english/data/model/quizz_vocabulary.dart';
import 'package:lap_english/data/model/sentence.dart';
import 'package:lap_english/data/model/skill.dart';
import 'package:lap_english/data/model/vocabulary.dart';

/*  Class quizz trừu tượng  */
abstract class Quizz {
  late String question;
  late Map<String, bool> answers;
  Skill get skill;

  List<Quizz> generate();
}

/*  Class khởi tạo các loại quizz   */
class Quizzes {
  static List<Quizz> generateQuizzVocabulary({required QuizzMode mode, required List<Word> words}) {
    List<Quizz> quizzesVocabulary = [];
    List<QuizzVocabulary> quizzList;

    switch(mode) {
      case QuizzMode.basic:
        quizzList = QuizzConstant.quizzesVocabularyBasic();
        break;
      case QuizzMode.medium:
        quizzList = QuizzConstant.quizzesVocabularyBasic();
        break;
      case QuizzMode.advanced:
        quizzList = QuizzConstant.quizzesVocabularyBasic();
        break;
    }

    for(var quizz in quizzList) {
      quizz.words = words;
      quizzesVocabulary.addAll(quizz.generate());
    }
    return quizzesVocabulary;
  }

  static List<Quizz> generateQuizzSentence({required QuizzMode mode, required List<Sentence> sentences}) {
    List<Quizz> quizzes = [];
    List<QuizzSentence> quizzList;

    switch(mode) {
      case QuizzMode.basic:
        quizzList = QuizzConstant.quizzesSentenceBasic();
        break;
      case QuizzMode.medium:
        quizzList = QuizzConstant.quizzesSentenceBasic();
        break;
      case QuizzMode.advanced:
        quizzList = QuizzConstant.quizzesSentenceBasic();
        break;
    }

    for(var quizz in quizzList) {
      quizz.sentences = sentences;
      quizzes.addAll(quizz.generate());
    }
    return quizzes;
  }
}

/*  Chế độ quizz  */
enum QuizzMode {
  basic,
  medium,
  advanced,
}