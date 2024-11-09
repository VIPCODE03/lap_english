
import 'dart:convert';

import 'package:lap_english/a_librarys/vip_sqflite/database_vip.dart';
import 'package:lap_english/data/model/learn/sentence.dart';

/*  Bảng câu  */
class SentenceTable extends TableSchema<MdlSentence> {
  static const String id = "id";
  static const String idSubTopic = "idSubTopic";
  static const String data = "data";

  @override
  Columns columns(MdlSentence obj) => columnBuild(addColumn: [
    column(name: id, value: obj.id),
    column(name: data, value: jsonEncode(obj.toJson())),
    column(name: idSubTopic, value: obj.idSubTopic),
  ]);

  @override
  MdlSentence generate(Column column) {
    if (column[data] != null) {
      return MdlSentence.fromJson(jsonDecode(column[data]));
    }
    return MdlSentence(0, 'sentence', 'translation', 0);
  }

  @override
  Key get key => Key(nameColumn: id);

  @override
  String get tableName => "SentenceTable";

}

/*  Bảng chủ đề con */
class SubSentenceTopicTable extends TableSchema<MdlSubSentenceTopic> {
  static const String id = "id";
  static const String data = "data";
  static const String idMainTopic = "idMainTopic";

  @override
  Columns columns(MdlSubSentenceTopic obj) => columnBuild(addColumn: [
    column(name: id, value: obj.id),
    column(name: data, value: jsonEncode(obj.toJson())),
    column(name: idMainTopic, value: obj.idMainTopic),
  ]);

  @override
  MdlSubSentenceTopic generate(Column column) {
    if (column[data] != null) {
      return MdlSubSentenceTopic.fromJson(jsonDecode(column[data]));
    }
    return MdlSubSentenceTopic(0, "name", "imageUrl", 0);
  }

  @override
  Key get key => Key(nameColumn: id);

  @override
  String get tableName => "SubSentenceTopicTable";

}

/*  Bảng chủ đề chính */
class MainSentenceTopicTable extends TableSchema<MdlMainSentenceTopic> {
  static const String id = "id";
  static const String data = "data";

  @override
  Columns columns(MdlMainSentenceTopic obj) => columnBuild(addColumn: [
    column(name: id, value: obj.id),
    column(name: data, value: jsonEncode(obj.toJson())),
  ]);

  @override
  MdlMainSentenceTopic generate(Column column) {
    if (column[data] != null) {
      return MdlMainSentenceTopic.fromJson(jsonDecode(column[data]));
    }
    return MdlMainSentenceTopic(0, 'name');
  }

  @override
  Key get key => Key(nameColumn: id);

  @override
  String get tableName => "MainSentenceTopicTable";

}