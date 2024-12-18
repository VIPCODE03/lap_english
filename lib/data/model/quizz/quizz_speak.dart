import 'dart:math';
import 'package:lap_english/data/model/learn/word_sentence.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/data/model/user/skill.dart';

abstract class QuizzSpeak<T> extends Quizz<T> {
  String pronounce = "";

  @override
  SkillType get skillType => SkillType.speaking;
}

class QuizzSpeakVocabulary extends QuizzSpeak<Word> {
  @override
  List<Quizz> generate(List<Word> datas) {
    List<QuizzSpeakVocabulary> quizzes = [];
    for(var word in datas) {
      var quizzSpeak = QuizzSpeakVocabulary();
      quizzSpeak.answerCorrect = word.word;
      var isWord = Random().nextBool();
      quizzSpeak.question = "Nói từ: "
          "${isWord
          ? "<${word.word}>"
          : "<${word.meaning}>"}";
      quizzSpeak.pronounce = word.pronounceUK;

      quizzes.add(quizzSpeak);
    }
    return quizzes;
  }

}