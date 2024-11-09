
import 'dart:math';

import 'package:lap_english/data/model/learn/vocabulary.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/data/model/user/skill.dart';

abstract class QuizzSoundChooseOne<T> extends Quizz<T> {
  bool showSoundBox = false;

  @override
  SkillType get skillType => SkillType.listening;
}

class QuizzSoundChooseOneVocabulary extends QuizzSoundChooseOne<MdlWord> {
  @override
  List<Quizz> generate() {
    List<QuizzSoundChooseOneVocabulary> quizzes = [];
    //--- Tạo quizz cho mỗi từ  ---
    for(var word in datas) {
      var quizzSound = QuizzSoundChooseOneVocabulary();
      quizzSound.showSoundBox = Random().nextBool();

      //--- Tạo câu hỏi ---
      if(quizzSound.showSoundBox) {
        quizzSound.question = "Bạn nghe được từ gì?";
      }
      else {
        quizzSound.question = "Phát âm: <${word.word}>";
      }

      //--- Tạo đáp án ---
      List<MdlWord> answers = [word];
      List<MdlWord> copy = List.from(datas)..remove(word);
      copy.shuffle();
      answers.addAll(copy.take(Random().nextBool() ? 1 : 3).toList());
      answers.shuffle();

      for(var w in answers) {
        quizzSound.answers.add(w.word);
        quizzSound.answersCorrect[w.word] = w == word;
      }
      quizzSound.answerCorrect = word.word;

      quizzes.add(quizzSound);
    }
    return quizzes;
  }
}

