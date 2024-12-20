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
  final Map<Type, Future<dynamic> Function(dynamic data, Map<String, dynamic> headers)> update = {
    User: (data, headers) => _updateUser(data as User),

    //--- Từ vựng ---
    MainTopic: (data, headers) => _updateMainTopic(data as MainTopic, headers),
    SubTopic: (data, headers) => _updateSubTopic(data as SubTopic, headers),
    Word: (data, headers) => _updateWord(data as Word),
    Sentence: (data, headers) => _updateSentence(data as Sentence),

    //--- Ngữ pháp  ---
    TypeGrammar: (datas, headers) => _updateTypeGrammar(datas as TypeGrammar),
    Grammar: (datas, headers) => _updateGrammar(datas as Grammar),
    GrammaticalStructure: (datas, headers) => _updateGrammaticalStructure(datas as GrammaticalStructure),
    ExerciseGrammar: (datas, headers) => _updateExerciseGrammar(datas as ExerciseGrammar),
  };

  static Future<bool> _updateUser(User data) async {
    try {
      UserService userService = UserService();
      await userService.update(data);
      return true;
    }
    catch(e) {
      return false;
    }
  }

  /*  Cập nhật từ vựng  */
  static Future<bool> _updateMainTopic(MainTopic data, Map<String, dynamic> headers) async {
    try {
      MainTopicService service = MainTopicService();
      if(headers['unlock']) {
        if(await service.unlock(data)) {
          data.status.locked = false;
          return true;
        }
        return false;
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

  static Future<bool> _updateSubTopic(SubTopic data, Map<String, dynamic> headers) async {
    try {
      SubTopicService service = SubTopicService();
        if (headers['unlock'] != null) {
          if (await service.unlock(data)) {
            data.status.locked = false;
            return true;
          }
          return false;
        }

        else if (headers['completed'] != null) {
          service.completed(data);
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

  static Future<void> _updateWord(Word data) async {
    WordDao dao = WordDao();
    dao.update(data);
  }

  static Future<void> _updateSentence(Sentence data) async {
    SentenceDao dao = SentenceDao();
    dao.update(data);
  }

  /*  Cập nhật ngữ pháp */
  static Future<void> _updateTypeGrammar(TypeGrammar data) async {
    TypeGrammarDao dao = TypeGrammarDao();
    dao.update(data);
  }

  static Future<void> _updateGrammar(Grammar data) async {
    GrammarDao dao = GrammarDao();
    dao.update(data);
  }

  static Future<void> _updateGrammaticalStructure(GrammaticalStructure data) async {
    GrammaticalStructureDao dao = GrammaticalStructureDao();
    dao.update(data);
  }

  static Future<void> _updateExerciseGrammar(ExerciseGrammar data) async {
    ExerciseGrammarDao dao = ExerciseGrammarDao();
    dao.update(data);
  }
}
