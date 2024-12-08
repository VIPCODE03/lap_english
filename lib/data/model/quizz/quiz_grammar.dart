import 'package:lap_english/data/model/learn/grammar.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';

import '../user/skill.dart';

class MdlQuizGrammar extends Quizz<CustomQuiz> {
  final GrammaticalStructure structure;
  late Quizz quiz;

  MdlQuizGrammar(this.structure);

  @override
  SkillType get skillType => SkillType.reading;

  @override
  List<Quizz> generate(List<CustomQuiz> datas) {
    List<MdlQuizGrammar> quizzes = [];

    for(var data in datas) {
      var newQuiz = MdlQuizGrammar(structure);
      newQuiz.question = data.question;
      newQuiz.quiz = Quizzes.generateQuizCustom(customQuizs: [data]).first;

      quizzes.add(newQuiz);
    }

    return quizzes;
  }
}