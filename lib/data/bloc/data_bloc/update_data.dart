import '../../caching/cache_manager.dart';
import '../../model/learn/sentence.dart';
import '../../model/learn/vocabulary.dart';
import '../../model/user/user.dart';

mixin UpdateDatas {
  final Map<Type, Future<void> Function(List<dynamic>)> update = {
    MainVocabularyTopic: (datas) => _vocabularyUpdate(datas as List<MainVocabularyTopic>),
    MainSentenceTopic: (datas) => _sentenceUpdate(datas as List<MainSentenceTopic>),
    User: (datas) => _userUpdate(datas as List<User>),
  };

  //===   Update từ vựng  ===
  static Future<void> _vocabularyUpdate(List<MainVocabularyTopic> datas) async {
    var cacheManager = CacheManager();
    await cacheManager.save(CacheKeys.mainVocabularyTopic, datas);
  }

  //===   Update câu  ===
  static Future<void> _sentenceUpdate(List<MainSentenceTopic> datas) async {
    var cacheManager = CacheManager();
    await cacheManager.save(CacheKeys.mainSentenceTopic, datas);
  }

  //===   Update người dùng   ===
  static Future<void> _userUpdate(List<User> datas) async {
    var cacheManager = CacheManager();
    await cacheManager.save(CacheKeys.user, datas);
  }
}
