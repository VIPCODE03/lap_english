
import 'package:lap_english/a_librarys/vip_sqflite/base_database_vip.dart';
import 'package:lap_english/a_librarys/vip_sqflite/database_vip.dart';
import 'package:lap_english/data/database/local/table/vocabulary_table.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';

import '../database.dart';

class WordDao extends BaseDatabase<MdlWord> {
  @override
  DatabaseApp get database => initdatabase();

  @override
  TableSchema<MdlWord> get table => WordTable();

  Future<List<MdlWord>> getWords(int subTopicId)
  => query('SELECT * FROM ${table.tableName} WHERE ${WordTable.subTopicId} = ?', [subTopicId]);
}

class SubVocabularyTopicDao extends BaseDatabase<MdlSubVocabularyTopic> {
  @override
  DatabaseApp get database => initdatabase();

  @override
  TableSchema<MdlSubVocabularyTopic> get table => SubVocabularyTopicTable();

  Future<List<MdlSubVocabularyTopic>> getSubVocabularyTopics(int idMainTopic)
  => query('SELECT * FROM ${table.tableName} WHERE ${SubVocabularyTopicTable.idMainTopic} = ?', [idMainTopic]);
}

class MainVocabularyTopicDao extends BaseDatabase<MdlMainVocabularyTopic> {
  @override
  DatabaseApp get database => initdatabase();

  @override
  TableSchema<MdlMainVocabularyTopic> get table => MainVocabularyTopicTable();

}