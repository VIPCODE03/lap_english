import 'package:lap_english/data/database/local/dao/grammar_dao.dart';
import 'package:lap_english/data/database/local/dao/sentence_dao.dart';
import 'package:lap_english/data/database/local/dao/user_dao.dart';
import 'package:lap_english/data/database/local/dao/vocabulary_dao.dart';
import 'package:lap_english/data/model/learn/grammar.dart';
import 'package:lap_english/data/model/learn/sentence.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';

import '../../data/model/user/user.dart';

mixin UpdateDatas {
  final Map<Type, Future<void> Function(List<dynamic>)> update = {
    User: (datas) => _updateUser(datas as List<User>),

    //--- Từ vựng ---
    MdlMainVocabularyTopic: (datas) => _updateMainVocabularyTopic(datas as List<MdlMainVocabularyTopic>),
    MdlSubVocabularyTopic: (datas) => _updateSubVocabularyTopic(datas as List<MdlSubVocabularyTopic>),
    MdlWord: (datas) => _updateWord(datas as List<MdlWord>),

    //--- Câu ---
    MdlMainSentenceTopic: (datas) => _updateMainSentenceTopic(datas as List<MdlMainSentenceTopic>),
    MdlSubSentenceTopic: (datas) => _updateSubSentenceTopic(datas as List<MdlSubSentenceTopic>),
    MdlSentence: (datas) => _updateSentence(datas as List<MdlSentence>),

    //--- Ngữ pháp  ---
    TypeGrammar: (datas) => _updateTypeGrammar(datas as List<TypeGrammar>),
    Grammar: (datas) => _updateGrammar(datas as List<Grammar>),
    GrammaticalStructure: (datas) => _updateGrammaticalStructure(datas as List<GrammaticalStructure>),
    ExerciseGrammar: (datas) => _updateExerciseGrammar(datas as List<ExerciseGrammar>),
  };

  static Future<void> _updateUser(List<User> datas) async {
    UserDao dao = UserDao();
    for (var data in datas) {
      await dao.update(data);
    }
  }

  /*  Cập nhật từ vựng  */
  static Future<void> _updateMainVocabularyTopic(List<MdlMainVocabularyTopic> datas) async {
    MainVocabularyTopicDao dao = MainVocabularyTopicDao();
    for (var data in datas) {
      await dao.update(data);
    }
  }

  static Future<void> _updateSubVocabularyTopic(List<MdlSubVocabularyTopic> datas) async {
    SubVocabularyTopicDao dao = SubVocabularyTopicDao();
    for (var data in datas) {
      await dao.update(data);
    }
  }

  static Future<void> _updateWord(List<MdlWord> datas) async {
    WordDao dao = WordDao();
    for (var data in datas) {
      await dao.update(data);
    }
  }

  /*  Cập nhật câu  */
  static Future<void> _updateMainSentenceTopic(List<MdlMainSentenceTopic> datas) async {
    MainSentenceTopicDao dao = MainSentenceTopicDao();
    for (var data in datas) {
      await dao.update(data);
    }
  }

  static Future<void> _updateSubSentenceTopic(List<MdlSubSentenceTopic> datas) async {
    SubSentenceTopicDao dao = SubSentenceTopicDao();
    for (var data in datas) {
      await dao.update(data);
    }
  }

  static Future<void> _updateSentence(List<MdlSentence> datas) async {
    SentenceDao dao = SentenceDao();
    for (var data in datas) {
      await dao.update(data);
    }
  }

  /*  Cập nhật ngữ pháp */
  static Future<void> _updateTypeGrammar(List<TypeGrammar> datas) async {
    TypeGrammarDao dao = TypeGrammarDao();
    for (var data in datas) {
      await dao.update(data);
    }
  }

  static Future<void> _updateGrammar(List<Grammar> datas) async {
    GrammarDao dao = GrammarDao();
    for (var data in datas) {
      await dao.update(data);
    }
  }

  static Future<void> _updateGrammaticalStructure(List<GrammaticalStructure> datas) async {
    GrammaticalStructureDao dao = GrammaticalStructureDao();
    for (var data in datas) {
      await dao.update(data);
    }
  }

  static Future<void> _updateExerciseGrammar(List<ExerciseGrammar> datas) async {
    ExerciseGrammarDao dao = ExerciseGrammarDao();
    for (var data in datas) {
      await dao.update(data);
    }
  }
}
