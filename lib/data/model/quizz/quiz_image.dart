import 'dart:math';
import 'package:lap_english/data/model/learn/vocabulary.dart';
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


class MdlQuizImageVocabulary extends MdlQuizImage<MdlWord> {
  @override
  List<Quizz> generate(List<MdlWord> datas) {
    List<MdlQuizImageVocabulary> quizes = [];

    //--- Lấy danh sách các từ có ảnh ---
    List<MdlWord> wordshasImage = datas.where((word) => word.imageUrl.isNotEmpty).toList();
    if(wordshasImage.length < 4) {
      return quizes;
    }

    for(var word in wordshasImage) {
      var newQuizImg = MdlQuizImageVocabulary();

      Set<String> answers = {};
      List<MdlWord> wordAnswers = [word];
      List<MdlWord> copy = List.from(datas)..remove(word);
      copy.shuffle();

      //--- Ảnh ở câu hỏi  ---
      if(Random().nextBool()) {
        newQuizImg.question = "Chọn từ tương ứng";
        newQuizImg.imgQuestion = word.imageUrl;

        wordAnswers.addAll(copy.take(2).toList());
      }

      //--- Ảnh ở đáp án  ---
      else {
        newQuizImg.question = "Chọn từ <${word.meaning}>";

        wordAnswers.addAll(copy.take(3).toList());
        for(var answer in wordAnswers) {
          newQuizImg.imgAnswer[answer.word] = answer.imageUrl;
        }
      }

      for(var answer in wordAnswers) {
        answers.add(answer.word);
        newQuizImg.answersCorrect[answer.word] = (answer == word);
      }

      newQuizImg.answers = answers.toList();

      //--- Thêm quizz vào danh sách  ---
      quizes.add(newQuizImg);
      quizes.shuffle();
    }

    return quizes;
  }
}