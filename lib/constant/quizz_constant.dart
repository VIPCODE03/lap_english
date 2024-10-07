
import 'package:lap_english/data/model/quizz_sentence.dart';
import 'package:lap_english/data/model/quizz_vocabulary.dart';

class QuizzConstant {
  static List<QuizzVocabulary> quizzesVocabularyBasic() => [
    QuizzChooseOneWord(),
    QuizzSoundOfWord(),
    QuizzSpeakWord(),
    QuizzWriteWord(),
  ];

  static List<QuizzSentence> quizzesSentenceBasic() => [
    QuizzSentenceChoose(),
  ];
}