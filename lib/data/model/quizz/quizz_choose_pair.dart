
import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/data/model/user/skill.dart';

abstract class QuizzChoosePair<T> extends Quizz<T> {


  @override
  SkillType get skillType => SkillType.reading;
}