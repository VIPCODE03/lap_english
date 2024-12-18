
import 'package:lap_english/a_librarys/vip_sqflite/base_database_vip.dart';
import 'package:lap_english/a_librarys/vip_sqflite/database_vip.dart';
import 'package:lap_english/data/database/local/table/w_s_table.dart';
import 'package:lap_english/data/model/learn/word_sentence.dart';

import '../database.dart';

class MainTopicDao extends BaseDatabase<MainTopic> {
  @override
  DatabaseApp get database => initdatabase();

  @override
  TableSchema<MainTopic> get table => MainTopicTable();
}

class SubTopicDao extends BaseDatabase<SubTopic> {
  @override
  DatabaseApp get database => initdatabase();

  @override
  TableSchema<SubTopic> get table => SubTopicTable();

  Future<List<SubTopic>> getSubVocabularyTopics(int idMainTopic)
  => query('SELECT * FROM ${table.tableName} WHERE ${SubTopicTable.idMainTopic} = ?', [idMainTopic]);
}

class WordDao extends BaseDatabase<Word> {
  @override
  DatabaseApp get database => initdatabase();

  @override
  TableSchema<Word> get table => WordTable();

  Future<List<Word>> getWords(int subTopicId)
  => query('SELECT * FROM ${table.tableName} WHERE ${WordTable.subTopicId} = ?', [subTopicId]);
}

class SentenceDao extends BaseDatabase<Sentence> {
  @override
  DatabaseApp get database => initdatabase();

  @override
  TableSchema<Sentence> get table => SentenceTable();

  getSentencesByIdSub(int idSubTopic)
  => query('SELECT * FROM ${table.tableName} WHERE ${SentenceTable.idSubTopic} = ?', [idSubTopic]);
}