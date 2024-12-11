import 'package:flutter/foundation.dart';
import 'package:lap_english/data/database/local/dao/grammar_dao.dart';
import 'package:lap_english/data/database/local/dao/sentence_dao.dart';
import 'package:lap_english/data/database/local/dao/user_dao.dart';
import 'package:lap_english/data/database/local/dao/vocabulary_dao.dart';
import 'package:lap_english/data/database/remote/service/user_service.dart';
import 'package:lap_english/data/database/remote/service/vocabulary_service.dart';
import 'package:lap_english/data/model/learn/grammar.dart';
import 'package:lap_english/data/model/learn/sentence.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';

import '../../data/database/remote/service/subtopic_service.dart';
import '../../data/model/user/user.dart';

mixin UpdateDatas {
  final Map<Type, Future<dynamic> Function(List<dynamic> datas, Map<String, dynamic> headers)> update = {
    User: (datas, headers) => _updateUser(datas as List<User>),

    //--- Từ vựng ---
    MdlMainVocabularyTopic: (datas, headers) => _updateMainVocabularyTopic(datas as List<MdlMainVocabularyTopic>, headers),
    MdlSubVocabularyTopic: (datas, headers) => _updateSubVocabularyTopic(datas as List<MdlSubVocabularyTopic>, headers),
    MdlWord: (datas, headers) => _updateWord(datas as List<MdlWord>),

    //--- Câu ---
    MdlMainSentenceTopic: (datas, headers) => _updateMainSentenceTopic(datas as List<MdlMainSentenceTopic>),
    MdlSubSentenceTopic: (datas, headers) => _updateSubSentenceTopic(datas as List<MdlSubSentenceTopic>),
    MdlSentence: (datas, headers) => _updateSentence(datas as List<MdlSentence>),

    //--- Ngữ pháp  ---
    TypeGrammar: (datas, headers) => _updateTypeGrammar(datas as List<TypeGrammar>),
    Grammar: (datas, headers) => _updateGrammar(datas as List<Grammar>),
    GrammaticalStructure: (datas, headers) => _updateGrammaticalStructure(datas as List<GrammaticalStructure>),
    ExerciseGrammar: (datas, headers) => _updateExerciseGrammar(datas as List<ExerciseGrammar>),
  };

  static Future<bool> _updateUser(List<User> datas) async {
    try {
      UserService userService = UserService(loggedIn: true);
      UserDao dao = UserDao();
      for (var data in datas) {
        dao.update(data);
        await userService.update(data);
      }
      return true;
    }
    catch(e) {
      return false;
    }
  }

  /*  Cập nhật từ vựng  */
  static Future<bool> _updateMainVocabularyTopic(List<MdlMainVocabularyTopic> datas, Map<String, dynamic> headers) async {
    try {
      MainTopicVocabularyService service = MainTopicVocabularyService();
      if(headers['unlock']) {
        service.unlock(datas.first);
      }
      else {
        if (kDebugMode) {
          print('Không tìm thấy header');
        }
      }
      return true;
    }
    catch(e) {
      return false;
    }
  }

  static Future<bool> _updateSubVocabularyTopic(List<MdlSubVocabularyTopic> datas, Map<String, dynamic> headers) async {
    try {
      SubTopicVocabularyService service = SubTopicVocabularyService();
      if(headers['unlock'] != null) {
        service.unlock(datas.first);
      }
      else if(headers['completed'] != null) {
        service.completed(datas.first);
      }
      else {
        if (kDebugMode) {
          print('Không tìm thấy header');
        }
        return false;
      }
      return true;
    }
    catch(e) {
      return false;
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
