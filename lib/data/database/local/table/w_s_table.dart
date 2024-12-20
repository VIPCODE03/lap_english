import 'dart:convert';
import 'package:lap_english/a_librarys/vip_sqflite/database_vip.dart';
import 'package:lap_english/data/model/learn/word_sentence.dart';
import 'package:lap_english/data/provider/model_provider.dart';

/*  Bảng câu  */
class SentenceTable extends TableSchema<Sentence> {
  static const String id = "id";
  static const String idSubTopic = "idSubTopic";
  static const String data = "data";

  @override
  Columns columns(Sentence obj) => columnBuild(addColumn: [
    column(name: id, value: obj.id),
    column(name: data, value: jsonEncode(obj.toJson())),
    column(name: idSubTopic, value: obj.subTopicId),
  ]);

  @override
  Sentence generate(Column column) {
    if (column[data] != null) {
      return Sentence.fromJson(jsonDecode(column[data]));
    }
    return Sentence(0, 'sentence', 'translation', 0);
  }

  @override
  Key get key => Key(nameColumn: id);

  @override
  String get tableName => "SentenceTable";

}

class WordTable extends TableSchema<Word> {
  static const String id = "id";
  static const String subTopicId = "subTopicId";
  static const String data = "data";

  @override
  Columns columns(Word obj) => columnBuild(addColumn: [
    column(name: id, value: obj.id),
    column(name: data, value: jsonEncode(obj.toJson())),
    column(name: subTopicId, value: obj.subTopicId),
  ]);

  @override
  Word generate(Column column) {
    if (column[data] != null) {
      return Word.fromJson(jsonDecode(column[data]));
    }
    return ModelEmptyProvider.word();
  }

  @override
  Key get key => Key(nameColumn: id);

  @override
  String get tableName => "WordTable";

}

/*  Bảng chủ đề con */
class SubTopicTable extends TableSchema<SubTopic> {
  static const String id = "id";
  static const String data = "data";
  static const String idMainTopic = "idMainTopic";

  @override
  Columns columns(SubTopic obj) => columnBuild(addColumn: [
    column(name: id, value: obj.id),
    column(name: data, value: jsonEncode(obj.toJson())),
    column(name: idMainTopic, value: obj.mainTopicId),
  ]);

  @override
  SubTopic generate(Column column) {
    if (column[data] != null) {
      return SubTopic.fromJson(jsonDecode(column[data]));
    }
    return ModelEmptyProvider.subTopic();
  }

  @override
  Key get key => Key(nameColumn: id);

  @override
  String get tableName => "SubSentenceTopicTable";

}

/*  Bảng chủ đề chính */
class MainTopicTable extends TableSchema<MainTopic> {
  static const String id = "id";
  static const String data = "data";

  @override
  Columns columns(MainTopic obj) => columnBuild(addColumn: [
    column(name: id, value: obj.id),
    column(name: data, value: jsonEncode(obj.toJson())),
  ]);

  @override
  MainTopic generate(Column column) {
    if (column[data] != null) {
      return MainTopic.fromJson(jsonDecode(column[data]));
    }
    return ModelEmptyProvider.mainSentenceTopic();
  }

  @override
  Key get key => Key(nameColumn: id);

  @override
  String get tableName => "MainSentenceTopicTable";

}