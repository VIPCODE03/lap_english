//
// import 'package:lap_english/a_librarys/vip_sqflite/base_database_vip.dart';
// import 'package:lap_english/a_librarys/vip_sqflite/database_vip.dart';
// import 'package:lap_english/data/database/local/table/word_table.dart';
// import 'package:lap_english/data/model/learn/vocabulary.dart';
//
// import '../database.dart';
//
// class WordDao extends BaseDatabase<Word> {
//   @override
//   DatabaseApp get database => initdatabase();
//
//   @override
//   TableSchema<Word> get table => WordTable();
//
//   getWords(int idSubtopic) => query('SELECT * FROM ${table.tableName} WHERE idSubtopic = ?', [idSubtopic]);
// }