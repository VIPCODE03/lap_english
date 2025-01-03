import 'package:lap_english/data/model/learn/ipa.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/data/model/quizz/quizzes.dart';

import '../user/skill.dart';

class QuizIPA extends Quizz<CustomQuiz> {
  final IPA ipa;
  late Quizz quiz;

  QuizIPA(this.ipa);

  @override
  SkillType get skillType => SkillType.listening;

  @override
  List<Quizz> generate(List<CustomQuiz> datas) {
    List<QuizIPA> quizzes = [];

    for(var data in datas) {
      var newQuiz = QuizIPA(ipa);
      newQuiz.question = data.question;
      newQuiz.quiz = Quizzes.generateQuizCustom(customQuizs: [data]).first;

      quizzes.add(newQuiz);
    }

    return quizzes;
  }
}