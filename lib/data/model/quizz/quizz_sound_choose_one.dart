
import 'dart:math';

import 'package:lap_english/data/model/learn/vocabulary.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/data/model/user/skill.dart';

abstract class QuizzSoundChooseOne<T> extends Quizz<T> {
  bool showSoundBox = false;

  @override
  SkillType get skillType => SkillType.listening;
}

class QuizzSoundChooseOneVocabulary extends QuizzSoundChooseOne<Word> {
  @override
  List<Quizz> generate() {
    List<QuizzSoundChooseOneVocabulary> quizzes = [];
    //--- Tạo quizz cho mỗi từ  ---
    for(var word in datas) {
      var quizzSound = QuizzSoundChooseOneVocabulary();
      quizzSound.showSoundBox = Random().nextBool();

      //--- Tạo câu hỏi ---
      if(quizzSound.showSoundBox) {
        quizzSound.question = "Phát âm: <${word.word}>";
      }
      else {
        quizzSound.question = "Bạn nghe được từ gì?";
      }

      //--- Tạo đáp án ---
      List<Word> answers = [word];
      List<Word> copy = List.from(datas)..remove(word);
      copy.shuffle();
      answers.addAll(copy.take(1).toList());
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

