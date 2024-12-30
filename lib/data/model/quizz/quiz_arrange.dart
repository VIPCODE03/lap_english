import 'package:lap_english/data/model/learn/word_sentence.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import '../user/skill.dart';

abstract class QuizArrange<T> extends Quizz<T> {
  @override
  SkillType get skillType => SkillType.reading;
}

class QuizzArrangeVocabulary extends QuizArrange<Word> {
  @override
  List<Quizz> generate(List<Word> datas) {
    List<QuizArrange> quizzes = [];

    for(var word in datas) {
      var newQuiz = QuizzArrangeVocabulary();

      newQuiz.question = 'Sắp xếp lại từ dưới đây có nghĩa là <${word.meaning}>';
      newQuiz.answerCorrect = word.word;
      newQuiz.answers.addAll(word.word.split(''));
      newQuiz.answers.shuffle();

      quizzes.add(newQuiz);
    }

    return quizzes;
  }
}