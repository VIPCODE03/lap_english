import 'dart:math';

import 'package:lap_english/data/model/learn/sentence.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import '../user/skill.dart';

abstract class QuizzSelect<T> extends Quizz<T> {
  @override
  SkillType get skillType => SkillType.reading;
}

class QuizzSelectSentence extends QuizzSelect<Sentence> {
  @override
  List<Quizz> generate() {
    List<QuizzSelectSentence> quizzes = [];

    for(var sentence in datas) {
      var quizzSelect = QuizzSelectSentence();
      quizzSelect.question = "Hoàn thành câu: <${sentence.translation}>";
      quizzSelect.answersCorrect = {
        for (var item in sentence.sentence.split(' '))
          item : true
      };
      quizzSelect.answerCorrect = sentence.sentence;
      quizzSelect.answers.addAll(quizzSelect.answersCorrect.keys.toList());

      quizzSelect.answers.shuffle();
      quizzes.add(quizzSelect);
    }

    return quizzes;
  }
}

class QuizzSelectVocabulary extends QuizzSelect<Word> {
  @override
  List<Quizz> generate() {
    List<QuizzSelectVocabulary> quizzes = [];

    List<Word> unusedWords = List.from(datas);  //-> Danh sách từ chưa sử dụng
    int numQuizzes = (datas.length / 3).ceil(); //-> Số quizz được tạo

    for (int i = 0; i < numQuizzes; i++) {
      var quizzSelect = QuizzSelectVocabulary();

      //--- Lấy ngẫu nhiên 2-3 từ ---
      int numWords = Random().nextInt(2) + 2;
      List<Word> selectedWords = (unusedWords..shuffle()).take(numWords).toList();
      unusedWords.removeWhere((word) => selectedWords.contains(word));

      bool isWord = Random().nextBool();
      //--- Tạo câu hỏi ---
      var wordList = selectedWords.map((w) => isWord ? w.word : w.meaning).join(", ");
      quizzSelect.question = "Chọn các từ: <$wordList>";

      //--- Tạo đáp án đúng ---
      for (var word in selectedWords) {
        quizzSelect.answersCorrect[isWord ? word.meaning : word.word] = true;
      }
      quizzSelect.answerCorrect = answersCorrect.keys.toString();

      //--- Tạo danh sách đáp án  ---
      List<Word> additionalWords = (datas.toList()..shuffle())
          .where((word) => !selectedWords.contains(word))
          .take(2)
          .toList();
      List<Word> allAnswers = [...selectedWords, ...additionalWords]..shuffle();

      for (var word in allAnswers) {
        quizzSelect.answers.add(isWord ? word.meaning : word.word);
      }

      quizzes.add(quizzSelect);
    }

    return quizzes;
  }

}