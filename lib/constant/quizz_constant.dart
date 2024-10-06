
import 'package:lap_english/data/model/quizz_vocabulary.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quizz_widget.dart';

import '../data/model/quizz.dart';

class QuizzConstant {
  static List<QuizzVocabulary> quizzesVocabularyBasic() => [
    QuizzChooseOneWord(),
    QuizzSoundOfWord(),
    QuizzSpeakWord(),
    QuizzWriteWord(),
  ];

  static Map<Quizz, QuizzWidget> quizzes() => {

  };
}