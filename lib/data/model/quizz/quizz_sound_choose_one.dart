import 'dart:math';

import 'package:lap_english/data/model/learn/word_sentence.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/data/model/user/skill.dart';

abstract class QuizzSoundChooseOne<T> extends Quizz<T> {
  bool showSoundBox = false;
  Map<String, String?> sounds = {};

  @override
  SkillType get skillType => SkillType.listening;
}

class QuizzSoundChooseOneVocabulary extends QuizzSoundChooseOne<Word> {
  @override
  List<Quizz> generate(List<Word> datas) {
    List<QuizzSoundChooseOneVocabulary> quizzes = [];
    //--- Tạo quizz cho mỗi từ  ---
    for(var word in datas) {
      var quizzSound = QuizzSoundChooseOneVocabulary();
      quizzSound.showSoundBox = Random().nextBool();

      //--- Tạo câu hỏi ---
      if(quizzSound.showSoundBox) {
        quizzSound.question = "Bạn nghe được từ gì?";
        quizzSound.sounds[word.word] = Random().nextBool() ? word.audioUkBlobName : word.audioUsBlobName;
      }
      else {
        quizzSound.question = "Phát âm: <${word.word}>";
      }

      //--- Tạo đáp án ---
      List<Word> answers = [word];
      List<Word> copy = List.from(datas)..remove(word);
      copy.shuffle();
      answers.addAll(copy.take(Random().nextBool() ? 1 : 3).toList());
      answers.shuffle();

      for(var w in answers) {
        quizzSound.answers.add(w.word);
        quizzSound.sounds[w.word] = Random().nextBool() ? w.audioUkBlobName : w.audioUsBlobName;
      }
      quizzSound.answerCorrect = word.word;

      quizzes.add(quizzSound);
    }
    return quizzes;
  }
}

class QuizSoundChooseOneCustom extends QuizzSoundChooseOne<CustomQuiz> {
  @override
  List<Quizz> generate(List<CustomQuiz> datas) {
    List<QuizSoundChooseOneCustom> quizes = [];

    for(var data in datas) {
      var newQuiz = QuizSoundChooseOneCustom();

      newQuiz.question = data.question;
      newQuiz.answers = data.answers..shuffle();
      newQuiz.answerCorrect = data.answerCorrect;

      newQuiz.showSoundBox = data.isShowBoxSound ?? Random().nextBool();
      newQuiz.sounds = data.sounds ?? {};

      quizes.add(newQuiz);
    }

    return quizes;
  }
}

