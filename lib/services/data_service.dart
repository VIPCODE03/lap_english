import 'package:lap_english/data/database/local/dao/grammar_dao.dart';
import 'package:lap_english/data/database/local/dao/w_s_dao.dart';

import '../a_data_test/data_grammar_test.dart';
import '../a_data_test/data_sentence1.dart';
import '../a_data_test/datatest.dart';
import '../data/model/learn/word_sentence.dart';

class DataService {

  Future<void> loadDataServer() async {
    // _loadDataUser();
    // _loadDataVocabulary();
    // _loadDataSentence();
    _loadDataGrammar();
  }

  Future<void> _loadDataVocabulary() async {
    var mainTopicDao = MainTopicDao();
    var subTopicDao = SubTopicDao();
    var wordDao = WordDao();

    // var gemini = GeminiAI(model: GeminiAI.flash);
    // String jsonString = await gemini.ask(botGenerateMain()) ?? 'a';
    // String jsonSub1 = await gemini.ask(botGenerateSub(jsonString)) ?? 'a';
    // String word = await gemini.ask(botGenerateWord(jsonSub1)) ?? 'a';

    try {
      // var jsonMain = jsonString.replaceFirst("json", "").replaceAll("```", "").trim();
      // var jsonSub = jsonSub1.replaceFirst("json", "").replaceAll("```", "").trim();
      // var jsonWord = word.replaceFirst("json", "").replaceAll("```", "").trim();
      //
      // List<dynamic> dataMain = jsonDecode(jsonMain);
      //
      // List<dynamic> dataSub = jsonDecode(jsonSub);
      //
      // List<dynamic> dataWord = jsonDecode(jsonWord);

      // dataMain.forEach((json) async
      // => mainTopicVocabularyDao.insert(MdlMainVocabularyTopic.fromJson(json)));
      //
      // dataSub.forEach((json) async
      // => subTopicVocabularyDao.insert(MdlSubVocabularyTopic.fromJson(json)));
      //
      // dataWord.forEach((json) async
      // => wordDao.insert(MdlWord.fromJson(json)));

      generateMainVocabularyTopics().forEach((data) async
      => mainTopicDao.insert(data));

      generateSubVocabularyTopics().forEach((data) async
      => subTopicDao.insert(data));

      generateWords().forEach((data) async
      => wordDao.insert(Word.fromJson(data)));

    } catch(e) {
      throw Exception(e);
    }
  }

  Future<void> _loadDataSentence() async {
    var mainDao = MainTopicDao();
    var subDao = SubTopicDao();
    var sentenceDao = SentenceDao();

    generateMainSentenceTopics().forEach((data) async
    => mainDao.insert(data));

    generateSubSentenceTopics().forEach((data) async
    => subDao.insert(data));

    generateSentences().forEach((data) async
    => sentenceDao.insert(data));

  }

  Future<void> _loadDataGrammar() async {
    var typeGrammarDao = TypeGrammarDao();
    var grammarDao = GrammarDao();
    var sructureDao = GrammaticalStructureDao();
    var exerciseDao = ExerciseGrammarDao();

    generateGrammarTypes().forEach((data) async
    => typeGrammarDao.insert(data));

    generateGrammars().forEach((data) async
    => grammarDao.insert(data));

    generateGrammaticalStructures().forEach((data) async
    => sructureDao.insert(data));

    generateExerciseGrammarForPresentSimple().forEach((data) async
    => exerciseDao.insert(data));
  }
}

