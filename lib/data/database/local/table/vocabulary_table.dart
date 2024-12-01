
import 'dart:convert';

import 'package:lap_english/a_librarys/vip_sqflite/database_vip.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';

/*  Bảng từ vựng  */
class WordTable extends TableSchema<MdlWord> {
  static const String id = "id";
  static const String idSubtopic = "idSubtopic";
  static const String data = "data";

  @override
  Columns columns(MdlWord obj) => columnBuild(addColumn: [
    column(name: id, value: obj.id),
    column(name: data, value: jsonEncode(obj.toJson())),
    column(name: idSubtopic, value: obj.idSubTopic),
  ]);

  @override
  MdlWord generate(Column column) {
    if (column[data] != null) {
      return MdlWord.fromJson(jsonDecode(column[data]));
    }
    return MdlWord(0, 'word', 'meaning', 'pronounceUK', 'pronounceUS', 'type', 'level', 'example', 'imageUrl', 0);
  }

  @override
  Key get key => Key(nameColumn: id);

  @override
  String get tableName => "WordTable";

}

/*  Bảng chủ đề con */
class SubVocabularyTopicTable extends TableSchema<MdlSubVocabularyTopic> {
  static const String id = "id";
  static const String data = "data";
  static const String idMainTopic = "idMainTopic";

  @override
  Columns columns(MdlSubVocabularyTopic obj) => columnBuild(addColumn: [
    column(name: id, value: obj.id),
    column(name: data, value: jsonEncode(obj.toJson())),
    column(name: idMainTopic, value: obj.idMainTopic),
  ]);

  @override
  MdlSubVocabularyTopic generate(Column column) {
    if (column[data] != null) {
      return MdlSubVocabularyTopic.fromJson(jsonDecode(column[data]));
    }
    return MdlSubVocabularyTopic(0, "name", "imageUrl", 0);
  }

  @override
  Key get key => Key(nameColumn: id);

  @override
  String get tableName => "SubVocabularyTopicTable";
  
}

/*  Bảng chủ đề chính */
class MainVocabularyTopicTable extends TableSchema<MdlMainVocabularyTopic> {
  static const String id = "id";
  static const String data = "data";

  @override
  Columns columns(MdlMainVocabularyTopic obj) => columnBuild(addColumn: [
    column(name: id, value: obj.id),
    column(name: data, value: jsonEncode(obj.toJson())),
  ]);

  @override
  MdlMainVocabularyTopic generate(Column column) {
    if (column[data] != null) {
      return MdlMainVocabularyTopic.fromJson(jsonDecode(column[data]));
    }
    return MdlMainVocabularyTopic(0, 'name');
  }

  @override
  Key get key => Key(nameColumn: id);

  @override
  String get tableName => "MainVocabularyTopicTable";

}