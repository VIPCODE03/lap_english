import 'package:flutter/foundation.dart';
import 'package:lap_english/data/database/local/dao/grammar_dao.dart';
import 'package:lap_english/data/database/local/dao/w_s_dao.dart';
import 'package:lap_english/data/database/remote/service/subtopic_service.dart';
import 'package:lap_english/data/database/remote/service/user_service.dart';
import 'package:lap_english/data/database/remote/service/maintopic_service.dart';
import 'package:lap_english/data/model/learn/grammar.dart';
import '../../data/model/learn/word_sentence.dart';
import '../../data/model/user/user.dart';

mixin UpdateDatas {
  final Map<Type, Future<dynamic> Function(List<dynamic> datas, Map<String, dynamic> headers)> update = {
    User: (datas, headers) => _updateUser(datas as List<User>),

    //--- Từ vựng ---
    MainTopic: (datas, headers) => _updateMainTopic(datas as List<MainTopic>, headers),
    SubTopic: (datas, headers) => _updateSubTopic(datas as List<SubTopic>, headers),
    Word: (datas, headers) => _updateWord(datas as List<Word>),
    Sentence: (datas, headers) => _updateSentence(datas as List<Sentence>),

    //--- Ngữ pháp  ---
    TypeGrammar: (datas, headers) => _updateTypeGrammar(datas as List<TypeGrammar>),
    Grammar: (datas, headers) => _updateGrammar(datas as List<Grammar>),
    GrammaticalStructure: (datas, headers) => _updateGrammaticalStructure(datas as List<GrammaticalStructure>),
    ExerciseGrammar: (datas, headers) => _updateExerciseGrammar(datas as List<ExerciseGrammar>),
  };

  static Future<bool> _updateUser(List<User> datas) async {
    try {
      UserService userService = UserService();
      for (var data in datas) {
        await userService.update(data);
      }
      return true;
    }
    catch(e) {
      return false;
    }
  }

  /*  Cập nhật từ vựng  */
  static Future<bool> _updateMainTopic(List<MainTopic> datas, Map<String, dynamic> headers) async {
    try {
      MainTopicService service = MainTopicService();
      if(headers['unlock']) {
        service.unlock(datas.first);
      }
      else {
        debugPrint('Không tìm thấy header');
        return false;
      }
      return true;
    }
    catch(e) {
      return false;
    }
  }

  static Future<bool> _updateSubTopic(List<SubTopic> datas, Map<String, dynamic> headers) async {
    try {
      SubTopicService service = SubTopicService();
        if (headers['unlock'] != null) {
          if (await service.unlock(datas.first)) {
            datas.first.status.locked = false;
            return true;
          }
          return false;
        }

        else if (headers['completed'] != null) {
          service.completed(datas.first);
          return true;
        }
        else {
          debugPrint('Không tìm thấy header');
          return false;
        }
    }
    catch(e) {
      return false;
    }
  }

  static Future<void> _updateWord(List<Word> datas) async {
    WordDao dao = WordDao();
    for (var data in datas) {
      await dao.update(data);
    }
  }

  static Future<void> _updateSentence(List<Sentence> datas) async {
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
