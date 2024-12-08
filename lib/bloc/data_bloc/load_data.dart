import 'package:lap_english/data/database/local/dao/grammar_dao.dart';
import 'package:lap_english/data/database/local/dao/sentence_dao.dart';
import 'package:lap_english/data/database/local/dao/user_dao.dart';
import 'package:lap_english/data/database/remote/service/vocabulary_service.dart';
import 'package:lap_english/data/model/learn/grammar.dart';
import 'package:lap_english/data/model/learn/sentence.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';

import '../../data/database/local/dao/vocabulary_dao.dart';
import '../../data/model/user/user.dart';

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

    //--- Ngữ pháp  ---
    TypeGrammar: (args) => _typeGrammarLoad(),
    Grammar: (args) => _grammarLoad(args),
    GrammaticalStructure: (args) => _grammarStructureLoad(args),
    ExerciseGrammar: (args) => _exerciseGrammarLoad(args),

  };

  /*  Load người dùng */
  static Future<List<User>> _userLoad() async {
    UserDao dao = UserDao();
    return dao.getData();
  }

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
    WordDao dao = WordDao();
    var words = await dao.getWords(idSubTopic);
    if(words.isEmpty) {
       words = await VocabularyService().fetchWord(idSubTopic);
       for(var word in words) {
         dao.insert(word);
       }
       return words;
    }

    return words;
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

  /*  Load ngữ pháp */
  static Future<List<Grammar>> _grammarLoad(int idTypeGrammar) async {
    GrammarDao dao = GrammarDao();
    return dao.getByIdType(idTypeGrammar);
  }

  static Future<List<TypeGrammar>> _typeGrammarLoad() async {
    TypeGrammarDao dao = TypeGrammarDao();
    return dao.getData(firstToLast: true);
  }

  static Future<List<GrammaticalStructure>> _grammarStructureLoad(int idGrammar) async {
    GrammaticalStructureDao dao = GrammaticalStructureDao();
    return dao.getByIdGrammar(idGrammar);
  }

  static Future<List<ExerciseGrammar>> _exerciseGrammarLoad(int idGrammaticalStructure) async {
    ExerciseGrammarDao dao = ExerciseGrammarDao();
    return dao.getByIdGrammarStructure(idGrammaticalStructure, 5);
  }
}