import 'package:json_annotation/json_annotation.dart';
import 'package:lap_english/constant/quizz_constant.dart';
import 'package:lap_english/data/model/learn/grammar.dart';
import 'package:lap_english/data/model/learn/sentence.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';
import 'package:lap_english/data/model/quizz/quiz_grammar.dart';
import 'package:lap_english/data/model/quizz/quizz_choose_one.dart';
import 'package:lap_english/data/model/quizz/quizz_select_answers.dart';
import 'package:lap_english/data/model/quizz/quizz_sound_choose_one.dart';
import 'package:lap_english/data/model/quizz/quizz_write.dart';

import '../user/skill.dart';
part 'quizz.g.dart';

/*  Class quizz trừu tượng  */
abstract class Quizz<T> {
  String question = "";
  List<String> answers = [];
  String answerCorrect = "";
  Map<String, bool> answersCorrect = {};

  SkillType get skillType;

  List<Quizz> generate(List<T> datas);
}

/*  Custom quiz */
@JsonSerializable()
class CustomQuiz {
  final TypeQuiz type;
  final String question;
  final List<String> answers;
  final String answerCorrect;
  final Map<String, bool> answersCorrect;
  final List<String>? imgAnswers;
  final String? imageQuestion;

  CustomQuiz(
      this.question,
      this.answers,
      this.answerCorrect,
      this.answersCorrect,
      this.type,
      {
        this.imgAnswers,
        this.imageQuestion
      }
  );

  /// Phương thức chuyển đổi từ JSON sang đối tượng Dart
  factory CustomQuiz.fromJson(Map<String, dynamic> json) => _$CustomQuizFromJson(json);

  /// Phương thức chuyển đổi từ đối tượng Dart sang JSON
  Map<String, dynamic> toJson() => _$CustomQuizToJson(this);
}

enum TypeQuiz{
  chooseOne,
  select,
  sound,
  image,
  write,
}

/*  Class khởi tạo các loại quizz   */
class Quizzes {
  static List<Quizz> generateQuizzVocabulary({required QuizzMode mode, required List<MdlWord> words}) {
    List<Quizz> quizzes = [];
    List<Quizz<MdlWord>> quizzList;

    switch(mode) {
      case QuizzMode.basic:
        quizzList = QuizzConstant.quizzesVocabularyBasic();
        break;
      case QuizzMode.custom:
        quizzList = QuizzConstant.quizzesVocabularyBasic();
        break;
    }

    for(var quizz in quizzList) {
      quizzes.addAll(quizz.generate(words));
    }
    return quizzes;
  }

  static List<Quizz> generateQuizzSentence({required QuizzMode mode, required List<MdlSentence> sentences}) {
    List<Quizz> quizzes = [];
    List<Quizz<MdlSentence>> quizzList;

    switch(mode) {
      case QuizzMode.basic:
        quizzList = QuizzConstant.quizzesSentenceBasic();
        break;
      case QuizzMode.custom:
        quizzList = QuizzConstant.quizzesSentenceBasic();
        break;
    }

    for(var quizz in quizzList) {
      quizzes.addAll(quizz.generate(sentences));
    }
    return quizzes;
  }

  static List<Quizz> generateQuizGrammar({required List<GrammaticalStructure> structures}) {
    List<Quizz> quizzes = [];
    
    List<CustomQuiz> customQuizs = [
      CustomQuiz("Chọn từ  <I ... d>",
          ["eat", "aet", "tea"],
          "eat",
          {"eat": true, "aet": false, "tea": false},
          TypeQuiz.chooseOne),

      CustomQuiz("Hoàn thành câu: <Tôi đã ăn sáng rồi>",
          ["I", "have", "eaten", "breakfast", "already"],
          "I have eaten breakfast already",
          {"I": true, "have": true, "eaten": true, "breakfast": true, "already": true},
          TypeQuiz.select),

      CustomQuiz("Hoàn thành câu: <Cô ấy chưa hoàn thành bài tập về nhà>",
          ["She", "has", "not", "finished", "her", "homework"],
          "She has not finished her homework",
          {"She": true, "has": true, "not": true, "finished": true, "her": true, "homework": true},
          TypeQuiz.select),

      CustomQuiz("Hoàn thành câu: <Chúng tôi đã sống ở đây 5 năm>",
          ["We", "have", "lived", "here", "for", "five", "years"],
          "We have lived here for five years",
          {"We": true, "have": true, "lived": true, "here": true, "for": true, "five": true, "years": true},
          TypeQuiz.select),

      CustomQuiz("Hoàn thành câu: <Anh ấy đã đến Paris một lần>",
          ["He", "has", "been", "to", "Paris", "once"],
          "He has been to Paris once",
          {"He": true, "has": true, "been": true, "to": true, "Paris": true, "once": true},
          TypeQuiz.select),

      CustomQuiz("Hoàn thành câu: <Họ chưa bao giờ đến Nhật Bản>",
          ["They", "have", "never", "been", "to", "Japan"],
          "They have never been to Japan",
          {"They": true, "have": true, "never": true, "been": true, "to": true, "Japan": true},
          TypeQuiz.select),

    ];

    for(var structure in structures) {
      for(var customQuiz in customQuizs) {
        quizzes.add(MdlQuizGrammar(structure, generateQuizCustom(customQuizs: [customQuiz]).first));
      }
    }

    return quizzes;
  }

  static List<Quizz> generateQuizCustom({required List<CustomQuiz> customQuizs}) {
    List<Quizz> quizes = [];

    for(var customQuiz in customQuizs) {
      switch(customQuiz.type) {
        case TypeQuiz.chooseOne:
          quizes.addAll(QuizChooseOneCustom().generate([customQuiz]));
        case TypeQuiz.select:
          quizes.addAll(QuizSelectCustom().generate([customQuiz]));
        case TypeQuiz.sound:
          quizes.addAll(QuizSoundChooseOneCustom().generate([customQuiz]));
        case TypeQuiz.image:
          // TODO: Handle this case.
        case TypeQuiz.write:
          quizes.addAll(QuizWriteCustom().generate([customQuiz]));
      }
    }
    
    return quizes;
  }
}

/*  Chế độ quizz  */
enum QuizzMode {
  basic,
  custom
}

/*  Kết quả quiz  */
class QuizzResult {
  bool isLearned;
  TypeQuizz type;

  int total;
  int totalSpeak;
  int totalListen;
  int totalRead;
  int totalWrite;

  int correct = 0;
  int correctSpeak = 0;
  int correctListen = 0;
  int correctWrite = 0;
  int correctRead = 0;
  int correctConsecutive = 0;

  QuizzResult(this.total, this.totalWrite, this.totalListen, this.totalRead, this.totalSpeak, this.isLearned, this.type);

  //=== Cập nhật kết quả  ===
  void update(bool isCorrect, SkillType skill, int newCorrectConsecutive) {
    if(isCorrect) {
      correct++;
      if(correctConsecutive < newCorrectConsecutive) correctConsecutive = newCorrectConsecutive;

      switch(skill) {
        case SkillType.reading:
          correctRead++; break;
        case SkillType.writing:
          correctWrite++; break;
        case SkillType.listening:
          correctListen++; break;
        case SkillType.speaking:
          correctSpeak++; break;
      }
    }
  }
}

enum TypeQuizz {
  quizzVocabulary,
  quizzSentence,
  quizGrammar,
  quizzCustom
}