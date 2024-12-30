import 'package:lap_english/data/database/local/dao/grammar_dao.dart';
import 'package:lap_english/data/database/local/dao/w_s_dao.dart';
import 'package:lap_english/data/database/remote/service/grammar_service.dart';
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

  /*  Load từ vựng và câu  */
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
    WordDao dao = WordDao();
    List<Word> words = await dao.getWords(idSubTopic);
    if(words.isEmpty) {
      words = await WordService().fetchByIdSubTopic(idSubTopic) ?? [];
      for(var word in words) {
        dao.insert(word);
      }
    }
    return words;
  }

  static Future<List<Sentence>> _sentenceLoad(int subTopicId) async {
    SentenceDao dao = SentenceDao();
    List<Sentence> sentences = await dao.getSentencesByIdSub(subTopicId);
    if(sentences.isEmpty) {
      sentences = await SentenceService().fetchByIdSubTopic(subTopicId) ?? [];
      for(var sentence in sentences) {
        dao.insert(sentence);
      }
    }
    return sentences;
  }

  /*  Load ngữ pháp */
  static Future<List<TypeGrammar>> _typeGrammarLoad() async {
    // return await GrammarService().fetchTypeGrammar() ?? [];
    return await TypeGrammarDao().getData(firstToLast: true);
  }

  static Future<List<Grammar>> _grammarLoad(int idTypeGrammar) async {
    // return await GrammarService().fetchGrammarByTypeGrammarId(idTypeGrammar) ?? [];
    return await GrammarDao().getByIdType(idTypeGrammar);
  }

  static Future<List<GrammaticalStructure>> _grammarStructureLoad(int idGrammar) async {
    // return await  GrammarService().fetchStructureByGrammarId(idGrammar) ?? [];
    return await GrammaticalStructureDao().getByIdGrammar(idGrammar);
  }

  static Future<List<ExerciseGrammar>> _exerciseGrammarLoad(int idGrammaticalStructure) async {
    // return await GrammarService().fetchExerciseGrammarByStructureId(idGrammaticalStructure) ?? [];
    return await ExerciseGrammarDao().getByIdGrammarStructure(idGrammaticalStructure, 10);
  }
}