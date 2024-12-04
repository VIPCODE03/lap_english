import 'package:lap_english/data/model/learn/grammar.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';

import '../user/skill.dart';

class MdlQuizGrammar extends Quizz<CustomQuiz> {
  final GrammaticalStructure structure;
  final Quizz quiz;

  MdlQuizGrammar(this.structure, this.quiz) {
    question = quiz.question;
    answerCorrect = quiz.answerCorrect;
  }

  @override
  SkillType get skillType => SkillType.reading;

  @override
  List<Quizz> generate(List<CustomQuiz> datas) {
    List<MdlQuizGrammar> quizzes = [];
    return quizzes;
  }
}