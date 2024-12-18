import 'package:lap_english/data/database/local/dao/grammar_dao.dart';
import 'package:lap_english/data/database/remote/service/subtopic_service.dart';
import 'package:lap_english/data/database/remote/service/user_service.dart';
import 'package:lap_english/data/database/remote/service/maintopic_service.dart';
import 'package:lap_english/data/database/remote/service/word_and_sentence_service.dart';
import 'package:lap_english/data/model/learn/grammar.dart';
import '../../data/model/learn/word_sentence.dart';
import '../../data/model/user/user.dart';

mixin LoadDatas {
  final Map<Type, Future<List<dynamic>> Function(dynamic args)> load = {
    User: (args) => _userLoad(),

    //--- Từ vựng1  ---
    MainTopic: (args) => _mainTopicLoad(args),
    SubTopic: (args) => _subTopicLoad(args),
    Word: (args) => _wordLoad(args),
    Sentence: (args) => _sentenceLoad(args),

    //--- Ngữ pháp  ---
    TypeGrammar: (args) => _typeGrammarLoad(),
    Grammar: (args) => _grammarLoad(args),
    GrammaticalStructure: (args) => _grammarStructureLoad(args),
    ExerciseGrammar: (args) => _exerciseGrammarLoad(args),
  };

  /*  Load người dùng */
  static Future<List<User>> _userLoad() async {
    UserService service = UserService();
    User? user = await service.fetch();
    if(user != null) return [user];
    return [];
  }

  /*  Load từ vựng  */
  static Future<List<MainTopic>> _mainTopicLoad(Type type) async {
    MainTopicService service = MainTopicService();
    List<MainTopic>? mains = await service.fetchAll(type);
    if(mains != null) {
      return mains;
    }
    return [];
  }

  static Future<List<SubTopic>> _subTopicLoad(int idMainTopic) async {
    SubTopicService service = SubTopicService();
    List<SubTopic>? mains = await service.fetchPage(idMainTopic, 0, 100);
    if(mains != null) {
      return mains;
    }
    return [];
  }

  static Future<List<Word>> _wordLoad(int idSubTopic) async {
    WordService service = WordService();
    List<Word>? words = await service.fetchByIdSubTopic(idSubTopic);
    if(words != null) {
      return words;
    }
    return [];
  }

  static Future<List<Sentence>> _sentenceLoad(int subTopicId) async {
    SentenceService service = SentenceService();
    var sentences = await service.fetchByIdSubTopic(subTopicId);
    if(sentences != null) return sentences;
    return[];
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