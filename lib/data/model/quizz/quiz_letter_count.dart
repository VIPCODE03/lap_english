import 'dart:math';

import 'package:lap_english/data/model/learn/word_sentence.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/data/model/user/skill.dart';

abstract class QuizLetterCount<T> extends Quizz<T> {
  late Map<String, bool> charDisplay;

  @override
  SkillType get skillType => SkillType.reading;

  Map<String, bool> _generateAnswer(String text) {
    Map<String, bool> charDisplay = {};
    int charHiddenLocation = Random().nextInt(3);
    int index = 0;

    //--- Kí tự ẩn ở cuối ---
    if(charHiddenLocation == 2) {
      String charShow = '';
      String charHidden = '';

      int charCount = Random().nextInt(text.length - 1);
      for(int i = text.length - 1; i >= 0; i--) {
        if(index <= charCount) {
          charHidden = '${text[i]}$charHidden';
          index++;
        }
        else {
          charShow = '${text[i]}$charShow';
        }
      }
      charDisplay[charShow] = true;
      charDisplay[charHidden] = false;
    }

    //--- Kí tự ẩn ở đầu  ---
    else if(charHiddenLocation == 0) {
      String charShow = '';
      String charHidden = '';

      int charCount = Random().nextInt(text.length - 1);
      for(int i = 0; i < text.length; i++) {
        if(index <= charCount) {
          charHidden = '$charHidden${text[i]}';
          index++;
        }
        else {
          charShow = '$charShow${text[i]}';
        }
      }

      charDisplay[charHidden] = false;
      charDisplay[charShow] = true;
    }

    //--- Kí tự ẩn ở giữa ---
    else {
      String charShow0 = '';
      String charShow1 = '';
      String charHidden = '';
      int charCount = Random().nextInt(text.length);

      for (int i = 0; i < text.length; i++) {
        if (i < charCount) {
          charShow0 = '$charShow0${text[i]}';
        } else if (i >= charCount && i < text.length - charCount) {
          charHidden = '$charHidden${text[i]}';
        } else {
          charShow1 = '$charShow1${text[i]}';
        }
      }

      charDisplay[charShow0] = true;
      charDisplay[charHidden] = false;
      charDisplay[charShow1] = true;
    }

    return charDisplay;
  }
}

class QuizLetterCountVocabulary extends QuizLetterCount<Word> {
  @override
  List<Quizz> generate(List<Word> datas) {
    List<QuizLetterCountVocabulary> quizzes = [];

    for(var word in datas) {
      var newQuiz = QuizLetterCountVocabulary();

      newQuiz.question = 'Từ <${word.meaning}> sau đây thiếu bao nhiêu kí tự';
      newQuiz.charDisplay = _generateAnswer(word.word);

      for(var answer in newQuiz.charDisplay.keys) {
        if(!newQuiz.charDisplay[answer]!) {
          newQuiz.answerCorrect = answer;
          newQuiz.answers.add(answer);
          break;
        }
      }

      bool count = newQuiz.answerCorrect.length > 1;

      for(var i = 0; i <= (count ? Random().nextInt(3) : 0); i++) {
        bool type = Random().nextBool();
        int fakeCharCount = type && count
            ? (newQuiz.answerCorrect.length - (i + 1))
            : (newQuiz.answerCorrect.length + (i + 1));
        String fakeAnswer = '';
        for (int j = 0; j < fakeCharCount; j++) {
          fakeAnswer += '0';
        }
        newQuiz.answers.add(fakeAnswer);
      }

      newQuiz.answers.shuffle();
      quizzes.add(newQuiz);
    }

    return quizzes;
  }
}