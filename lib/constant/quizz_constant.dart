
import 'package:lap_english/data/model/learn/sentence.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/data/model/quizz/quizz_choose_one.dart';
import 'package:lap_english/data/model/quizz/quizz_select_answers.dart';
import 'package:lap_english/data/model/quizz/quizz_sound_choose_one.dart';
import 'package:lap_english/data/model/quizz/quizz_speak.dart';
import 'package:lap_english/data/model/quizz/quizz_write.dart';

class QuizzConstant {

  //===   Tạo quizz từ vựng đơn giản  ===
  static List<Quizz<Word>> quizzesVocabularyBasic() => [
    QuizzChooseOneVocabulary(),
    QuizzSelectVocabulary(),
    QuizzSoundChooseOneVocabulary(),
    // QuizzSpeakVocabulary(),
    QuizzWriteVocabulary(),
  ];

  //===   Tạo quizz câu đơn giản  ===
  static List<Quizz<Sentence>> quizzesSentenceBasic() => [
    QuizzChooseOneSentence(),
    QuizzSelectSentence(),
  ];
}