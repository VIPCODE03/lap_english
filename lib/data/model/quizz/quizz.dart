import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:lap_english/constant/quizz_constant.dart';
import 'package:lap_english/data/database/local/dao/grammar_dao.dart';
import 'package:lap_english/data/model/learn/grammar.dart';
import 'package:lap_english/data/model/quizz/quiz_grammar.dart';
import 'package:lap_english/data/model/quizz/quizz_choose_one.dart';
import 'package:lap_english/data/model/quizz/quizz_select_answers.dart';
import 'package:lap_english/data/model/quizz/quizz_sound_choose_one.dart';
import 'package:lap_english/data/model/quizz/quizz_write.dart';

import '../learn/word_sentence.dart';
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

  factory CustomQuiz.fromJson(Map<String, dynamic> json) => _$CustomQuizFromJson(json);

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

  static Future<List<Quizz>> generateQuizzVocabulary({required QuizzMode mode, required List<Word> words}) async {
    List<Quizz> quizzes = [];
    List<Quizz<Word>> quizzList;

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

  static Future<List<Quizz>> generateQuizzSentence({required QuizzMode mode, required List<Sentence> sentences}) async {
    List<Quizz> quizzes = [];
    List<Quizz<Sentence>> quizzList;

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

  static Future<List<Quizz>> generateQuizGrammar({required List<GrammaticalStructure> structures}) async {
    List<Quizz> quizzes = [];
    ExerciseGrammarDao dao = ExerciseGrammarDao();

    for (var structure in structures) {
      List<ExerciseGrammar> exercises = await dao.getByIdGrammarStructure(structure.id, 5);

      List<CustomQuiz> customQuizzes = [];
      for (var exercise in exercises) {
        customQuizzes.add(exercise.quiz);
      }

      quizzes.addAll(MdlQuizGrammar(structure).generate(customQuizzes));
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
  bool isLearned = Random().nextBool();
  int idObject = 0;
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

  int bonus = 5;
  int pointRank = 0;

  int totalWord;
  int totalSentence;
  int totalGrammar;

  QuizzResult(
      this.total,
      this.totalWrite,
      this.totalListen,
      this.totalRead,
      this.totalSpeak,
      this.type,
      this.totalWord,
      this.totalSentence,
      this.totalGrammar,
      {required dynamic object}) {

    if(object is SubTopic) {
      idObject = object.id;
    }

    else if(object is Grammar) {
      idObject = object.id;
    }

    else {
      idObject = 0;
    }
  }

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

  //=== Lấy tên quiz  ===
  String get nameQuiz => switch(type) {
      TypeQuizz.quizzVocabulary => "Quiz từ vựng",

      TypeQuizz.quizzSentence => "Quiz câu",

      TypeQuizz.quizzCustom => throw UnimplementedError(),

      TypeQuizz.quizGrammar => "Quiz ngữ pháp",
  };

  Map<String, dynamic> toMap() {
    return {
      'isLearned': isLearned,
      'idObject': idObject,
      'type': type.toString(),
      'total': total,
      'totalSpeak': totalSpeak,
      'totalListen': totalListen,
      'totalRead': totalRead,
      'totalWrite': totalWrite,
      'correct': correct,
      'correctSpeak': correctSpeak,
      'correctListen': correctListen,
      'correctWrite': correctWrite,
      'correctRead': correctRead,
      'correctConsecutive': correctConsecutive,
      'bonus': bonus,
      'pointRank': pointRank,
      'totalWord': totalWord,
      'totalSentence': totalSentence,
      'totalGrammar': totalGrammar,
    };
  }
}

enum TypeQuizz {
  quizzVocabulary,
  quizzSentence,
  quizGrammar,
  quizzCustom
}