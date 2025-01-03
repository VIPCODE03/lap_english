import 'dart:math';
import 'package:lap_english/data/model/learn/word_sentence.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/data/model/user/skill.dart';

abstract class MdlQuizImage<T> extends Quizz<T> {
  String imgQuestion = "";
  Map<String, String> imgAnswer = {};

  @override
  SkillType get skillType => SkillType.reading;
}


class MdlQuizImageVocabulary extends MdlQuizImage<Word> {
  @override
  List<Quizz> generate(List<Word> datas) {
    List<MdlQuizImageVocabulary> quizes = [];

    //--- Lấy danh sách các từ có ảnh ---
    List<Word> wordshasImage = datas.where((word) => word.imageBlobName != null).toList();
    if(wordshasImage.length < 4) {
      return quizes;
    }

    for(var word in wordshasImage) {
      var newQuizImg = MdlQuizImageVocabulary();

      Set<String> answers = {};
      List<Word> wordAnswers = [word];
      List<Word> copy = List.from(datas)..remove(word);
      copy.shuffle();

      //--- Ảnh ở câu hỏi  ---
      if(Random().nextBool()) {
        newQuizImg.question = "Chọn từ tương ứng";
        newQuizImg.imgQuestion = word.imageBlobName!;
        wordAnswers.addAll(copy.take(2).toList());
      }

      //--- Ảnh ở đáp án  ---
      else {
        newQuizImg.question = "Chọn từ <${word.meaning}>";

        wordAnswers.addAll(copy.take(3).toList());
        for(var answer in wordAnswers) {
          newQuizImg.imgAnswer[answer.word] = answer.imageBlobName!;
        }
      }

      for(var answer in wordAnswers) {
        answers.add(answer.word);
      }

      newQuizImg.answers = answers.toList();
      newQuizImg.answers.shuffle();
      newQuizImg.answerCorrect = word.word;

      quizes.add(newQuizImg);
    }

    return quizes;
  }
}

class QuizImageCustom extends MdlQuizImage<CustomQuiz> {
  @override
  List<Quizz> generate(List<CustomQuiz> datas) {
    List<QuizImageCustom> quizes = [];

    for(var data in datas) {
      var newQuiz = QuizImageCustom();
      newQuiz.question = data.question;
      newQuiz.answers = data.answers;
      newQuiz.answerCorrect = data.answerCorrect;

      if(data.imageQuestion != null) {
        newQuiz.imgQuestion = data.imageQuestion!;
        quizes.add(newQuiz);
      }
      else if(data.imgAnswers != null && data.imgAnswers!.isNotEmpty) {
        newQuiz.imgAnswer = data.imgAnswers!;
        quizes.add(newQuiz);
      }
    }

    return quizes;
  }
}