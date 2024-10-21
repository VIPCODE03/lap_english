
import 'package:lap_english/data/model/quizz_sentence.dart';
import 'package:lap_english/data/model/quizz_vocabulary.dart';

class QuizzConstant {

  //===   Tạo quizz từ vựng đơn giản  ===
  static List<QuizzVocabulary> quizzesVocabularyBasic() => [
    QuizzChooseOneWord(),
    QuizzSoundOfWord(),
    QuizzSpeakWord(),
    QuizzWriteWord(),
  ];

  //===   Tạo quizz câu đơn giản  ===
  static List<QuizzSentence> quizzesSentenceBasic() => [
    QuizzSentenceChoose(),
  ];
}