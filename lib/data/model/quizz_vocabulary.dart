
import 'dart:math';

import 'package:lap_english/data/model/quizz.dart';
import 'package:lap_english/data/model/skill.dart';
import 'package:lap_english/data/model/vocabulary.dart';

/*  QuizVocabulary trừu tượng   */
abstract class QuizzVocabulary extends Quizz {
  late List<Word> _words;
  set words(List<Word> words) => _words = words;

  @override
  List<Quizz> generate() => generateQuizzVocabulary(_words);

  //===   Hàm các lớp con cần khởi tạo  ===
  List<QuizzVocabulary> generateQuizzVocabulary(List<Word> words);
}

/*  Trắc nghiệm 2-4 đáp án  */
class QuizzChooseOneWord extends QuizzVocabulary {
  @override
  List<QuizzVocabulary> generateQuizzVocabulary(List<Word> words) {
    List<QuizzVocabulary> quizzes = [];

    //--- Tạo đáp án cho mỗi từ ---
    for(var word in words) {
      var quizzChooseOneWord = QuizzChooseOneWord();
      quizzChooseOneWord.answers = {};

      //--- Dạng từ tương tự  ---
      if(word.word.length > 3 && Random().nextBool()) {
        quizzChooseOneWord.question = "Chọn từ có nghĩa với <${word.meaning}>";

        //--- Tạo đáp án ---
        String wordS = word.word;
        int indexAdd = Random().nextInt(wordS.length - 1);
        int indexDelete = Random().nextInt(wordS.length -1) + 1;
        String charAtIndex = wordS[indexAdd + 1];
        String wordAdd = wordS.substring(0, indexAdd + 1) + charAtIndex + wordS.substring(indexAdd);
        String wordDelete = wordS.substring(0, indexDelete) + wordS.substring(indexDelete + 1);
        String wordReplace = wordS.substring(0, indexDelete) + charAtIndex + wordS.substring(indexDelete + 1);
        List<String> similarWords = [wordS, wordAdd, wordDelete, wordReplace];
        similarWords.shuffle();
        for(var w in similarWords) {
          quizzChooseOneWord.answers[w] = (w == wordS);
        }
      }

      //--- Dạng hỏi nghĩa  ---
      else {
        int total = Random().nextInt(2) + 2; //->  Tạo số đáp án
        quizzChooseOneWord.question = "Chọn từ có nghĩa với <${word.word}>";

        //--- Tạo đáp án ---
        List<Word> wordsT = [word];
        List<Word> copy = List.from(words)..remove(word);
        copy.shuffle();
        wordsT.addAll(copy.take(total).toList());

        wordsT.shuffle();
        for (var w in wordsT) {
          quizzChooseOneWord.answers[w.meaning] = (w == word);
        }
      }

      //--- Thêm quizz vào danh sách  ---
      quizzes.add(quizzChooseOneWord);
      quizzes.shuffle();
    }
    return quizzes;
  }

  @override
  Skill get skill => Skills.reading;
}

/*  Chọn âm thanh của từ  */
class QuizzSoundOfWord extends QuizzVocabulary {
  late bool isHidden;
  late String? correctWord;

  @override
  List<QuizzVocabulary> generateQuizzVocabulary(List<Word> words) {
    List<QuizzSoundOfWord> quizzes = [];
    //--- Tạo quizz cho mỗi từ  ---
    for(var word in words) {
      var quizzSoundOfWord = QuizzSoundOfWord();
      quizzSoundOfWord.isHidden = Random().nextBool();

      //--- Tạo câu hỏi ---
      if(quizzSoundOfWord.isHidden) {quizzSoundOfWord.question = "Phát âm của từ <${word.word}>";}
      else {
        quizzSoundOfWord.question = "Bạn nghe được từ gì?";
        quizzSoundOfWord.correctWord = word.word;
      }

      //--- Tạo đáp án ---
      quizzSoundOfWord.answers = {};
      List<Word> answers = [word];
      List<Word> copy = List.from(words)..remove(word);
      copy.shuffle();
      answers.addAll(copy.take(1).toList());

      answers.shuffle();
      for(var w in answers) {
        quizzSoundOfWord.answers[w.word] = w == word;
      }

      quizzes.add(quizzSoundOfWord);
    }
    return quizzes;
  }

  @override
  Skill get skill => Skills.listening;
}

/*  Nói */
class QuizzSpeakWord extends QuizzVocabulary {
  String answer = "";

  @override
  List<QuizzVocabulary> generateQuizzVocabulary(List<Word> words) {
    List<QuizzSpeakWord> quizzes = [];
    for(var word in words) {
      var quizzSpeak = QuizzSpeakWord();
      quizzSpeak.answer = word.word;
      var isWord = Random().nextBool();
      quizzSpeak.question = "Cách đọc từ "
          "${isWord
          ? "<${word.word}>"
          : "<${word.meaning}>"}";

      quizzSpeak.answers = {};
      quizzes.add(quizzSpeak);
    }
    return quizzes;
  }

  @override
  Skill get skill => Skills.speakking;

}

/*  Hoàn thành từ */
class QuizzWriteWord extends QuizzVocabulary {
  String answer = "";

  @override
  List<QuizzVocabulary> generateQuizzVocabulary(List<Word> words) {
    List<QuizzWriteWord> quizzes = [];

    for(var word in words) {
      var quizzWrite = QuizzWriteWord();
      quizzWrite.question = "Điền từ có nghĩa với <${word.meaning}>";
      quizzWrite.answer = word.word.toLowerCase().trim();
      quizzWrite.answers = {answer : true};
      quizzes.add(quizzWrite);
    }

    return quizzes;
  }

  @override
  Skill get skill => Skills.writing;

}