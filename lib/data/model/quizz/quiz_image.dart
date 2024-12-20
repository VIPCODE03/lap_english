import 'dart:math';
import 'package:lap_english/data/model/learn/word_sentence.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/data/model/user/skill.dart';

abstract class MdlQuizImage<T> extends Quizz<T> {
  String imgQuestion = "";
  Map<String, String> imgAnswer = {};

  @override
  SkillType get skillType {
    return SkillType.reading;
  }
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
        newQuizImg.answersCorrect[answer.word] = (answer == word);
      }

      newQuizImg.answers = answers.toList();
      newQuizImg.answers.shuffle();

      //--- Thêm quizz vào danh sách  ---
      quizes.add(newQuizImg);
      quizes.shuffle();
    }

    return quizes;
  }
}