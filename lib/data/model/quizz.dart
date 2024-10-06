
import 'package:lap_english/constant/quizz_constant.dart';
import 'package:lap_english/data/model/quizz_vocabulary.dart';
import 'package:lap_english/data/model/skill.dart';
import 'package:lap_english/data/model/vocabulary.dart';

/*  Class quizz trừu tượng  */
abstract class Quizz {
  late String question;
  late Map<String, bool> answers;
  Skill get skill;

  List<Quizz> create();
}

/*  Class khởi tạo các loại quizz   */
class Quizzes {
  static List<Quizz> createQuizzVocabulary({required QuizzMode mode, required List<Word> words}) {
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
      quizzesVocabulary.addAll(quizz.create());
    }
    return quizzesVocabulary;
  }
}

/*  Chế độ quizz  */
enum QuizzMode {
  basic,
  medium,
  advanced,
}