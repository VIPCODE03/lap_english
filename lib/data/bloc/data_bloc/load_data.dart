import 'dart:convert';
import 'package:lap_english/data/database/local/dao/sentence_dao.dart';
import 'package:lap_english/data/model/learn/sentence.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';

import '../../../a_data_test/data_user_test.dart';
import '../../caching/cache_manager.dart';
import '../../database/local/dao/vocabulary_dao.dart';
import '../../model/user/user.dart';

mixin LoadDatas {
  final Map<Type, Future<List<dynamic>> Function(dynamic args)> load = {
    User: (args) => _userLoad(),

    //--- Từ vựng1  ---
    MdlMainVocabularyTopic: (args) => _mainVocabularyTopicLoad(),
    MdlSubVocabularyTopic: (args) => _subVocabularyTopicLoad(args),
    MdlWord: (args) => _wordLoad(args),

    //--- Câu ---
    MdlMainSentenceTopic: (args) => _mainSentenceTopicLoad(),
    MdlSubSentenceTopic: (args) => _subSentenceTopicLoad(args),
    MdlSentence: (args) => _sentenceLoad(args),
  };

  /*  Load từ vựng  */
  static Future<List<MdlMainVocabularyTopic>> _mainVocabularyTopicLoad() async {
    MainVocabularyTopicDao mainDao = MainVocabularyTopicDao();
    return mainDao.getData(firstToLast: true);
  }

  static Future<List<MdlSubVocabularyTopic>> _subVocabularyTopicLoad(int idMainTopic) async {
    SubVocabularyTopicDao subDao = SubVocabularyTopicDao();
    return subDao.getSubVocabularyTopics(idMainTopic);
  }

  static Future<List<MdlWord>> _wordLoad(int idSubTopic) async {
    WordDao wordDao = WordDao();
    return wordDao.getWords(idSubTopic);
  }

  /*  Load câu  */
  static Future<List<MdlMainSentenceTopic>> _mainSentenceTopicLoad() async {
    MainSentenceTopicDao mainDao = MainSentenceTopicDao();
    return mainDao.getData(firstToLast: true);
  }

  static Future<List<MdlSubSentenceTopic>> _subSentenceTopicLoad(int idMainTopic) async {
    SubSentenceTopicDao subDao = SubSentenceTopicDao();
    return subDao.getSubSentenceTopics(idMainTopic);
  }

  static Future<List<MdlSentence>> _sentenceLoad(int idSubTopic) async {
    SentenceDao dao = SentenceDao();
    return dao.getSentencesByIdSub(idSubTopic);
  }

//===   Load người dùng   ===
  static Future<List<User>> _userLoad() async {
    var cacheManager = CacheManager();
    final cacheUser = cacheManager.get(CacheKeys.user);
    if(cacheUser != null) {
      return cacheUser.map((item) => User.fromJson(item)).toList();
    }
    else {
      List<dynamic> userMap = jsonDecode(UserDataTest.getUserJson());
      List<User> users = userMap.map((item) => User.fromJson(item)).toList();
      cacheManager.save(CacheKeys.user, users);
      return users;
    }
  }
}