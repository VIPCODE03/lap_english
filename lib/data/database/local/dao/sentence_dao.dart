
import 'package:lap_english/a_librarys/vip_sqflite/base_database_vip.dart';
import 'package:lap_english/a_librarys/vip_sqflite/database_vip.dart';
import 'package:lap_english/data/database/local/table/sentence_table.dart';
import 'package:lap_english/data/model/learn/sentence.dart';

import '../database.dart';

class SentenceDao extends BaseDatabase<MdlSentence> {
  @override
  DatabaseApp get database => initdatabase();

  @override
  TableSchema<MdlSentence> get table => SentenceTable();

  getSentencesByIdSub(int idSubTopic)
  => query('SELECT * FROM ${table.tableName} WHERE ${SentenceTable.idSubTopic} = ?', [idSubTopic]);
}

class SubSentenceTopicDao extends BaseDatabase<MdlSubSentenceTopic> {
  @override
  DatabaseApp get database => initdatabase();

  @override
  TableSchema<MdlSubSentenceTopic> get table => SubSentenceTopicTable();

  Future<List<MdlSubSentenceTopic>> getSubSentenceTopics(int idMainTopic)
  => query('SELECT * FROM ${table.tableName} WHERE ${SubSentenceTopicTable.idMainTopic} = ?', [idMainTopic]);
}

class MainSentenceTopicDao extends BaseDatabase<MdlMainSentenceTopic> {
  @override
  DatabaseApp get database => initdatabase();

  @override
  TableSchema<MdlMainSentenceTopic> get table => MainSentenceTopicTable();

}