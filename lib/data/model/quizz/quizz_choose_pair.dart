
import 'package:lap_english/data/model/learn/vocabulary.dart';

import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/data/model/user/skill.dart';

abstract class QuizzChoosePair<T> extends Quizz<T> {
  Map<String, String> answersPair = {};

  @override
  SkillType get skillType => SkillType.reading;
}

class QuizzChoosePairVocabulary extends QuizzChoosePair<MdlWord> {
  @override
  List<Quizz> generate() {
    List<QuizzChoosePairVocabulary> quizzes = [];

      var quizzChoosePair = QuizzChoosePairVocabulary();
      quizzChoosePair.question = "Hoàn thành các cặp từ";

      //--- Tạo đáp án  ---
      quizzChoosePair.answersPair = {
        for (var word in datas) word.word : word.meaning
      };

      quizzes.add(quizzChoosePair);
      return quizzes;
  }
}