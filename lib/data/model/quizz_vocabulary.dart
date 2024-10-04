
import 'dart:math';

import 'package:lap_english/data/model/quizz.dart';
import 'package:lap_english/data/model/vocabulary.dart';

/*  QuizVocabulary trừu tượng   */
abstract class QuizzVocabulary extends Quizz {
  late List<Word> _words;
  set words(List<Word> words) => _words = words;

  @override
  List<Quizz> create() => createQuizz(_words);

  //===   Hàm các lớp con cần khởi tạo  ===
  List<QuizzVocabulary> createQuizz(List<Word> words);
}

/*  Trắc nghiệm 2-4 đáp án  */
class QuizzChooseOneWord extends QuizzVocabulary {
  @override
  List<QuizzVocabulary> createQuizz(List<Word> words) {
    List<QuizzVocabulary> quizzes = [];

    //--- Tạo đáp án cho mỗi từ ---
    for(var word in words) {
      int total = Random().nextInt(2) + 2;  //->  Tạo số đáp án
      var quizzChooseOneWord = QuizzChooseOneWord();
      quizzChooseOneWord.question = "Chọn từ có nghĩa với <${word.word}>";

      //--- Tạo đáp án ---
      quizzChooseOneWord.answers = {};
      List<Word> wordsT = [word];
      List<Word> copy = List.from(words)..remove(word);
      copy.shuffle();
      wordsT.addAll(copy.take(total).toList());

      wordsT.shuffle();
      for(var w in wordsT) {
          quizzChooseOneWord.answers[w.meaning] = (w == word);
      }

      //--- Thêm quizz vào danh sách  ---
      quizzes.add(quizzChooseOneWord);
      quizzes.shuffle();
    }
    return quizzes;
  }
}

/*  Chọn âm thanh của từ  */
class QuizzSoundOfWord extends QuizzVocabulary {
  late bool isHidden;
  @override
  List<QuizzVocabulary> createQuizz(List<Word> words) {
    List<QuizzVocabulary> quizzes = [];
    //--- Tạo quizz cho mỗi từ  ---
    for(var word in words) {
      var quizzSoundOfWord = QuizzSoundOfWord();
      quizzSoundOfWord.isHidden = Random().nextBool();

      //--- Tạo câu hỏi ---
      if(quizzSoundOfWord.isHidden) {quizzSoundOfWord.question = "Phát âm của từ <${word.word}>";}
      else {quizzSoundOfWord.question = "Bạn nghe được từ gì?";}

      //--- Tạo đáp án ---
      quizzSoundOfWord.answers = {word.word : true};
      List<Word> answersWrong = [];
      List<Word> copy = List.from(words)..remove(word);
      copy.shuffle();
      answersWrong.addAll(copy.take(1).toList());

      for(var wordWrong in answersWrong) {
        quizzSoundOfWord.answers[wordWrong.word] = false;
      }

      quizzes.add(quizzSoundOfWord);
    }
    return quizzes;
  }
}