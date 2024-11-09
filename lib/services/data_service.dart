
import 'package:lap_english/data/database/local/dao/sentence_dao.dart';
import 'package:lap_english/data/database/local/dao/vocabulary_dao.dart';

import '../a_data_test/data_sentence1.dart';
import '../a_data_test/datatest.dart';
import '../data/model/learn/vocabulary.dart';

class DataService {

  Future<void> loadDataServer() async {
    _loadDataVocabulary();
    _loadDataSentence();
  }

  Future<void> _loadDataVocabulary() async {
    var mainTopicVocabularyDao = MainVocabularyTopicDao();
    var subTopicVocabularyDao = SubVocabularyTopicDao();
    var wordDao = WordDao();

    for (var data in generateMainVocabularyTopics()) {
      mainTopicVocabularyDao.insert(MdlMainVocabularyTopic.fromJson(data));
    }

    for (var data in generateSubVocabularyTopics()) {
      subTopicVocabularyDao.insert(MdlSubVocabularyTopic.fromJson(data));
    }

    for (var data in generateWords()) {
      wordDao.insert(MdlWord.fromJson(data));
    }
  }

  Future<void> _loadDataSentence() async {
    var mainDao = MainSentenceTopicDao();
    var subDao = SubSentenceTopicDao();
    var sentenceDao = SentenceDao();

    for (var data in generateMainSentenceTopics()) {
      mainDao.insert(data);
    }

    for (var data in generateSubSentenceTopics()) {
      subDao.insert(data);
    }

    for (var data in generateSentences()) {
      sentenceDao.insert(data);
    }
  }
}
