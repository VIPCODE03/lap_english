import 'package:lap_english/a_librarys/vip_sqflite/base_database_vip.dart';
import 'package:lap_english/a_librarys/vip_sqflite/database_vip.dart';
import 'package:lap_english/data/database/local/table/grammar_table.dart';
import 'package:lap_english/data/model/learn/grammar.dart';

import '../database.dart';

class GrammarDao extends BaseDatabase<Grammar> {
  @override
  DatabaseApp get database => initdatabase();

  @override
  TableSchema<Grammar> get table => GrammarTable();

  getByIdType(int idTypeGrammar)
  => query('SELECT * FROM ${table.tableName} WHERE ${GrammarTable.idTypeGrammar} = ?', [idTypeGrammar]);
}

class GrammaticalStructureDao extends BaseDatabase<GrammaticalStructure> {
  @override
  DatabaseApp get database => initdatabase();

  @override
  TableSchema<GrammaticalStructure> get table => GrammaticalStructureTable();

  getByIdGrammar(int idGrammar)
  => query('SELECT * FROM ${table.tableName} WHERE ${GrammaticalStructureTable.idGrammar} = ?', [idGrammar]);
}

class TypeGrammarDao extends BaseDatabase<TypeGrammar> {
  @override
  DatabaseApp get database => initdatabase();

  @override
  TableSchema<TypeGrammar> get table => TypeGrammarTable();
}

class ExerciseGrammarDao extends BaseDatabase<ExerciseGrammar> {
  @override
  DatabaseApp get database => initdatabase();

  @override
  TableSchema<ExerciseGrammar> get table => ExerciseGrammarTable();

  Future<List<ExerciseGrammar>> getByIdGrammarStructure(int idGrammaticalStructure, int limit) => query(
    'SELECT * FROM ${table.tableName} WHERE ${ExerciseGrammarTable.idGrammaticalStructure} = ? LIMIT $limit',
    [idGrammaticalStructure],
  );
}