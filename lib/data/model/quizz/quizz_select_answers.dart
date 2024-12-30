import 'dart:math';

import 'package:lap_english/data/model/learn/word_sentence.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import '../user/skill.dart';

abstract class QuizzSelect<T> extends Quizz<T> {
  @override
  SkillType get skillType => SkillType.reading;
}

class QuizzSelectSentence extends QuizzSelect<Sentence> {
  @override
  List<Quizz> generate(List<Sentence> datas) {
    List<QuizzSelectSentence> quizzes = [];

    for(var sentence in datas) {
      var quizzSelect = QuizzSelectSentence();
      quizzSelect.question = "Hoàn thành câu: <${sentence.translation}>";

      //--- Tạo đáp án  ---
      quizzSelect.answers.addAll(sentence.sentence.split(' '));

      //--- Tạo đáp án đúng ---
      quizzSelect.answerCorrect = '[';
      for (var answer in quizzSelect.answers) {
        if (quizzSelect.answerCorrect.length == 1) {
          quizzSelect.answerCorrect += answer;
        } else {
          quizzSelect.answerCorrect += ', $answer';
        }
      }
      quizzSelect.answerCorrect += ']';


      quizzSelect.answers.shuffle();
      quizzes.add(quizzSelect);
    }

    return quizzes;
  }
}

class QuizzSelectVocabulary extends QuizzSelect<Word> {
  @override
  List<Quizz> generate(List<Word> datas) {
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
      var wordList = selectedWords.map((w) => isWord ? '<${w.word}>' : '<${w.meaning}>').join(" | ");
      quizzSelect.question = "Chọn các từ: $wordList";

      //--- Tạo đáp án đúng ---
      quizzSelect.answerCorrect = '[';
      for (var word in selectedWords) {
        String correctAnswer = isWord ? word.meaning : word.word;
        if (quizzSelect.answerCorrect.length == 1) {
          quizzSelect.answerCorrect += correctAnswer;
        } else {
          quizzSelect.answerCorrect += ', $correctAnswer';
        }
      }
      quizzSelect.answerCorrect += ']';

      //--- Tạo danh sách đáp án  ---
      List<Word> additionalWords = (datas..shuffle())
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

class QuizSelectCustom extends QuizzSelect<CustomQuiz> {
  @override
  List<Quizz> generate(List<CustomQuiz> datas) {
    List<QuizSelectCustom> quizzes = [];

    for(var data in datas) {
      var quizzSelect = QuizSelectCustom();
      quizzSelect.question = data.question;
      quizzSelect.answerCorrect = '[';
      for(var answer in data.answerCorrect.split(' ')) {
        if (quizzSelect.answerCorrect.length == 1) {
          quizzSelect.answerCorrect += answer;
        } else {
          quizzSelect.answerCorrect += ', $answer';
        }
      }
      quizzSelect.answerCorrect += ']';
      quizzSelect.answers = data.answers;
      quizzSelect.answers.shuffle();
      quizzes.add(quizzSelect);
    }

    return quizzes;
  }
}
