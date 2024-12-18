
import 'dart:math';

import 'package:lap_english/data/model/learn/word_sentence.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/data/model/user/skill.dart';

/*  Quizz chọn 1 đáp án */

abstract class QuizzChooseOne<T> extends Quizz<T> {
  @override
  SkillType get skillType => SkillType.reading;
}

/*  Từ vựng */

class QuizzChooseOneVocabulary extends QuizzChooseOne<Word> {
  @override
  List<Quizz> generate(List<Word> datas) {
    List<QuizzChooseOne> quizzes = [];

    //--- Tạo đáp án cho mỗi từ ---
    for(var word in datas) {
      var quizzChooseOneWord = QuizzChooseOneVocabulary();

      //--- Dạng 1  ---
      if(word.word.length > 3 && Random().nextBool()) {
        quizzChooseOneWord.question = "Chọn từ có nghĩa với <${word.meaning}>";

        //--- Tạo đáp án ---
        String wordS = word.word;
        Set<String> answers = {};
        int indexAdd = Random().nextInt(wordS.length - 1);
        int indexDelete = Random().nextInt(wordS.length -1) + 1;
        String charAtIndex = wordS[indexAdd + 1];
        String wordAdd = wordS.substring(0, indexAdd + 1) + charAtIndex + wordS.substring(indexAdd);
        String wordDelete = wordS.substring(0, indexDelete) + wordS.substring(indexDelete + 1);
        String wordReplace = wordS.substring(0, indexDelete) + charAtIndex + wordS.substring(indexDelete + 1);
        List<String> similarWords = [wordS, wordAdd, wordDelete, wordReplace]..shuffle();

        for(var w in similarWords) {
          answers.add(w);
          quizzChooseOneWord.answersCorrect[w] = (w == wordS);
        }

        quizzChooseOneWord.answers = answers.toList();
      }

      //--- Dạng 2  ---
      else {
        int total = Random().nextInt(2) + 2; //->  Tạo số đáp án
        quizzChooseOneWord.question = "Chọn từ có nghĩa với <${word.word}>";

        //--- Tạo đáp án ---
        Set<String> answers = {};
        List<Word> wordsT = [word];
        List<Word> copy = List.from(datas)..remove(word);
        copy.shuffle();
        wordsT.addAll(copy.take(total).toList());

        wordsT.shuffle();
        for (var w in wordsT) {
          answers.add(w.meaning);
          quizzChooseOneWord.answersCorrect[w.meaning] = (w == word);
        }

        quizzChooseOneWord.answers = answers.toList();
      }

      //--- Thêm quizz vào danh sách  ---
      quizzes.add(quizzChooseOneWord);
      quizzes.shuffle();
    }
    return quizzes;
  }
}

/*  Câu */
class QuizzChooseOneSentence extends QuizzChooseOne<Sentence> {
  @override
  List<Quizz> generate(List<Sentence> datas) {
    List<QuizzChooseOneSentence> quizzes = [];

    for(var sentence in datas) {
      var quizzChoose = QuizzChooseOneSentence();
      quizzChoose.question = "Chọn bản dịch nghĩa của câu <${sentence.sentence}>";

      List<Sentence> answers = [sentence];
      List<Sentence> copy = List.from(datas)..remove(sentence);
      copy.shuffle();
      answers.addAll(copy.take(Random().nextBool() ? 2 : 1).toList());
      answers.shuffle();

      for(var s in answers) {
        quizzChoose.answers.add(s.translation);
        quizzChoose.answersCorrect[s.translation] = s == sentence;
      }
      quizzes.add(quizzChoose);
      quizzes.shuffle(); //-> Xáo trộn
    }

    return quizzes;
  }
}

/*  Custom  */
class QuizChooseOneCustom extends QuizzChooseOne<CustomQuiz> {
  @override
  List<Quizz> generate(List<CustomQuiz> datas) {
    List<QuizChooseOneCustom> quizes = [];

    for(var data in datas) {
      var newQuiz = QuizChooseOneCustom();
      newQuiz.question = data.question;
      newQuiz.answers = data.answers..shuffle();
      newQuiz.answerCorrect = data.answerCorrect;
      newQuiz.answersCorrect = data.answersCorrect;

      quizes.add(newQuiz);
    }

    return quizes;
  }
}