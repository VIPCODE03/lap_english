
import 'package:lap_english/data/model/learn/vocabulary.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/data/model/user/skill.dart';

abstract class QuizzWrite<T> extends Quizz<T> {
  @override
  SkillType get skillType => SkillType.writing;
}

class QuizzWriteVocabulary extends QuizzWrite<MdlWord> {
  @override
  List<Quizz> generate(List<MdlWord> datas) {
    List<QuizzWriteVocabulary> quizzes = [];

    for(var word in datas) {
      var quizzWrite = QuizzWriteVocabulary();
      quizzWrite.question = "Điền từ có nghĩa: <${word.meaning}>";
      quizzWrite.answerCorrect = word.word.toLowerCase().trim();
      quizzes.add(quizzWrite);
    }

    return quizzes;
  }

}

class QuizWriteCustom extends QuizzWrite<CustomQuiz> {
  @override
  List<Quizz> generate(List<CustomQuiz> datas) {
    List<QuizWriteCustom> quizzes = [];

    for(var data in datas) {
      var newQuiz = QuizWriteCustom();
      newQuiz.question = data.question;
      newQuiz.answerCorrect = data.answerCorrect.toLowerCase().trim();

      quizzes.add(newQuiz);
    }

    return quizzes;
  }
}