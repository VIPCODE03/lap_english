import 'dart:convert';
import '../../../a_data_test/data_user_test.dart';
import '../../../a_data_test/datatest.dart';
import '../../../services/bot.dart';
import '../../caching/cache_manager.dart';
import '../../model/learn/sentence.dart';
import '../../model/learn/vocabulary.dart';
import '../../model/user/user.dart';

mixin LoadDatas {
  final Map<Type, Future<List<dynamic>> Function()> load = {
    MainVocabularyTopic: () => _vocabularyLoad(),
    MainSentenceTopic: () => _sentenceLoad(),
    User: () => _userLoad(),
  };

//===   Load từ vựng  ===
  static Future<List<MainVocabularyTopic>> _vocabularyLoad() async {
    var cacheManager = CacheManager();
    final cacheData = cacheManager.get(CacheKeys.mainVocabularyTopic);
    if(cacheData != null) {
      return cacheData.map((data) => MainVocabularyTopic.fromJson(data)).toList();
    }
    else {
      const String jsonString = MockData.jsonString;
      List<dynamic> jsonData = jsonDecode(jsonString);
      return jsonData.map((item) => MainVocabularyTopic.fromJson(item))
          .toList();
    }
  }

//===   Load câu  ===
  static Future<List<MainSentenceTopic>> _sentenceLoad() async {
    var cacheManager = CacheManager();
    final cacheData = cacheManager.get(CacheKeys.mainSentenceTopic);
    if(cacheData != null) {
      return cacheData.map((data) => MainSentenceTopic.fromJson(data)).toList();
    }
    else {
      String jsonString = await GeminiAI(model: GeminiAI.flash).ask(createW()) ?? '';
      List<dynamic> jsonData = jsonDecode(jsonString);
      List<MainSentenceTopic> mainTopics = jsonData.map((item) => MainSentenceTopic.fromJson(item)).toList();
      cacheManager.save(CacheKeys.mainSentenceTopic, mainTopics);
      return mainTopics;
    }
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