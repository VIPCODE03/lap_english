
import 'package:lap_english/data/model/quizz_vocabulary.dart';
import 'package:lap_english/data/model/vocabulary.dart';

/*  Class quizz trừu tượng  */
abstract class Quizz {
  late String question;
  late Map<String, bool> answers;

  List<Quizz> create();
}

/*  Class khởi tạo các loại quizz   */
class Quizzes {
  static List<Quizz> createQuizzVocabulary(List<QuizzVocabulary> quizzList, List<Word> words) {
    List<Quizz> quizzesVocabulary = [];
    for(var quizz in quizzList) {
      quizz.words = words;
      quizzesVocabulary.addAll(quizz.create());
    }
    return quizzesVocabulary;
  }
}
