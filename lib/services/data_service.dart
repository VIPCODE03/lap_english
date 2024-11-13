
import 'dart:convert';

import 'package:lap_english/a_data_test/data_user_test.dart';
import 'package:lap_english/data/database/local/dao/sentence_dao.dart';
import 'package:lap_english/data/database/local/dao/user_dao.dart';
import 'package:lap_english/data/database/local/dao/vocabulary_dao.dart';

import '../a_data_test/data_sentence1.dart';
import '../a_data_test/datatest.dart';
import '../data/model/learn/vocabulary.dart';
import 'bot.dart';

class DataService {

  Future<void> loadDataServer() async {
    _loadDataUser();
    await _loadDataVocabulary();
    _loadDataSentence();
  }

  Future<void> _loadDataVocabulary() async {
    var mainTopicVocabularyDao = MainVocabularyTopicDao();
    var subTopicVocabularyDao = SubVocabularyTopicDao();
    var wordDao = WordDao();

    var gemini = GeminiAI(model: GeminiAI.flash);
    String jsonString = await gemini.ask(botGenerateMain()) ?? 'a';
    String jsonSub1 = await gemini.ask(botGenerateSub(jsonString)) ?? 'a';
    String word = await gemini.ask(botGenerateWord(jsonSub1)) ?? 'a';

    try {
      List<dynamic> jsonMain = jsonDecode(jsonString);
      List<dynamic> jsonSub = jsonDecode(jsonSub1);
      List<dynamic> jsonWord = jsonDecode(word);

      jsonMain.forEach((json) async
      => mainTopicVocabularyDao.insert(MdlMainVocabularyTopic.fromJson(json)));

      jsonSub.forEach((json) async
      => subTopicVocabularyDao.insert(MdlSubVocabularyTopic.fromJson(json)));

      jsonWord.forEach((json) async
      => wordDao.insert(MdlWord.fromJson(json)));

      generateMainVocabularyTopics().forEach((data) async
      => mainTopicVocabularyDao.insert(MdlMainVocabularyTopic.fromJson(data)));

      generateSubVocabularyTopics().forEach((data) async
      => subTopicVocabularyDao.insert(MdlSubVocabularyTopic.fromJson(data)));

      generateWords().forEach((data) async
      => wordDao.insert(MdlWord.fromJson(data)));
    } catch(e) {
      throw Exception(e);
    }
  }

  Future<void> _loadDataSentence() async {
    var mainDao = MainSentenceTopicDao();
    var subDao = SubSentenceTopicDao();
    var sentenceDao = SentenceDao();

    generateMainSentenceTopics().forEach((data) async
    => mainDao.insert(data));

    generateSubSentenceTopics().forEach((data) async
    => subDao.insert(data));

    generateSentences().forEach((data) async
    => sentenceDao.insert(data));

  }

  Future<void> _loadDataUser() async {
    UserDao().insert(generateUser().first);
  }
}

