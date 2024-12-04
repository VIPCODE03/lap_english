import 'dart:math';

import 'package:lap_english/data/model/learn/vocabulary.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import '../learn/sentence.dart';
import '../user/skill.dart';

abstract class QuizzSelect<T> extends Quizz<T> {
  @override
  SkillType get skillType => SkillType.reading;
}

class QuizzSelectSentence extends QuizzSelect<MdlSentence> {
  @override
  List<Quizz> generate(List<MdlSentence> datas) {
    List<QuizzSelectSentence> quizzes = [];

    for(var sentence in datas) {
      var quizzSelect = QuizzSelectSentence();
      quizzSelect.question = "Hoàn thành câu: <${sentence.translation}>";

      //--- Tạo đáp án  ---
      quizzSelect.answerCorrect = sentence.sentence;
      quizzSelect.answersCorrect = {
        for (var item in sentence.sentence.split(' '))
          item: true
      };
      quizzSelect.answers.addAll(quizzSelect.answersCorrect.keys.toList());
      quizzSelect.answers.shuffle();
      quizzes.add(quizzSelect);
    }

    return quizzes;
  }
}

class QuizzSelectVocabulary extends QuizzSelect<MdlWord> {
  @override
  List<Quizz> generate(List<MdlWord> datas) {
    List<QuizzSelectVocabulary> quizzes = [];

    List<MdlWord> unusedWords = List.from(datas);  //-> Danh sách từ chưa sử dụng
    int numQuizzes = (datas.length / 3).ceil(); //-> Số quizz được tạo

    for (int i = 0; i < numQuizzes; i++) {
      var quizzSelect = QuizzSelectVocabulary();

      //--- Lấy ngẫu nhiên 2-3 từ ---
      int numWords = Random().nextInt(2) + 2;
      List<MdlWord> selectedWords = (unusedWords..shuffle()).take(numWords).toList();
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
      List<MdlWord> additionalWords = (datas..shuffle())
          .where((word) => !selectedWords.contains(word))
          .take(2)
          .toList();
      List<MdlWord> allAnswers = [...selectedWords, ...additionalWords]..shuffle();

      for (var word in allAnswers) {
        quizzSelect.answers.add(isWord ? word.meaning : word.word);
      }

      quizzes.add(quizzSelect);
    }

    return quizzes;
  }
}

class QuizSelectCustom extends QuizzSelect<CustomQuiz> {
  @override
  List<Quizz> generate(List<CustomQuiz> datas) {
    List<QuizSelectCustom> quizzes = [];

    for(var data in datas) {
      var quizzSelect = QuizSelectCustom();
      quizzSelect.question = data.question;
      quizzSelect.answerCorrect = data.answerCorrect;
      quizzSelect.answersCorrect = data.answersCorrect;
      quizzSelect.answers = data.answers;
      quizzSelect.answers.shuffle();
      quizzes.add(quizzSelect);
    }

    return quizzes;
  }
}

class SelectCustom {

}