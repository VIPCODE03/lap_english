import 'package:lap_english/data/model/quizz/quiz_grammar.dart';
import 'package:lap_english/data/model/quizz/quiz_ipa.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/data/model/quizz/quizz_choose_one.dart';
import 'package:lap_english/data/model/quizz/quizz_select_answers.dart';
import 'package:lap_english/data/model/quizz/quizz_sound_choose_one.dart';
import 'package:lap_english/data/model/quizz/quizz_write.dart';

import '../../../constant/quizz_constant.dart';
import '../../database/local/dao/grammar_dao.dart';
import '../learn/challenge.dart';
import '../learn/grammar.dart';
import '../learn/ipa.dart';
import '../learn/word_sentence.dart';

/*  Class khởi tạo các loại quizz   */
class Quizzes {

  static Future<List<Quizz>> generateQuizzVocabulary({required List<Word> words}) async {
    List<Quizz> quizzes = [];
    for(var quizz in QuizzConstant.quizzesVocabularyBasic()) {
      quizzes.addAll(quizz.generate(words));
    }
    return quizzes;
  }

  static Future<List<Quizz>> generateQuizzSentence({required List<Sentence> sentences}) async {
    List<Quizz> quizzes = [];
    for(var quizz in QuizzConstant.quizzesSentenceBasic()) {
      quizzes.addAll(quizz.generate(sentences));
    }
    return quizzes;
  }

  static Future<List<Quizz>> generateQuizGrammar({required List<GrammaticalStructure> structures}) async {
    List<Quizz> quizzes = [];

    for (var structure in structures) {
      // List<ExerciseGrammar> exercises = await GrammarService().fetchExerciseGrammarByStructureId(structure.id) ?? [];
      List<ExerciseGrammar> exercises = await ExerciseGrammarDao().getByIdGrammarStructure(structure.id, 10);
      List<CustomQuiz> customQuizzes = [];
      for (var exercise in exercises) {
        customQuizzes.add(exercise.quiz);
      }

      quizzes.addAll(MdlQuizGrammar(structure).generate(customQuizzes));
    }

    return quizzes;
  }

  static Future<List<Quizz>> generateQuizIPA({required List<IPA> ipas}) async {
    List<Quizz> quizzes = [];

    for (var ipa in ipas) {
      List<CustomQuiz> customQuizzes = [];
      for (var exercise in providerExerciseIPA()) {
        customQuizzes.add(exercise.quiz);
      }

      quizzes.addAll(QuizIPA(ipa).generate(customQuizzes));
    }

    return quizzes;
  }

  static Future<List<Quizz>> generateQuizChallenge({required Challenge challenge}) async {
    return generateQuizCustom(customQuizs: challenge.quizzes);
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