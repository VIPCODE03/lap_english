import 'dart:convert';

import 'package:lap_english/a_librarys/vip_sqflite/database_vip.dart';
import 'package:lap_english/data/model/learn/grammar.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';

/*  Bảng ngữ pháp  */
class GrammarTable extends TableSchema<Grammar> {
  static const String id = "id";
  static const String idTypeGrammar = "idTypeGrammar";
  static const String data = "data";

  @override
  Columns columns(Grammar obj) => columnBuild(addColumn: [
    column(name: id, value: obj.id),
    column(name: data, value: jsonEncode(obj.toJson())),
    column(name: idTypeGrammar, value: obj.typeGrammarId),
  ]);

  @override
  Grammar generate(Column column) {
    if (column[data] != null) {
      return Grammar.fromJson(jsonDecode(column[data]));
    }
    return Grammar(0, '', '', 0);
  }

  @override
  Key get key => Key(nameColumn: id);

  @override
  String get tableName => "GrammarTable";

}

/*  Bảng loại ngữ pháp */
class TypeGrammarTable extends TableSchema<TypeGrammar> {
  static const String id = "id";
  static const String data = "data";

  @override
  Columns columns(TypeGrammar obj) => columnBuild(addColumn: [
    column(name: id, value: obj.id),
    column(name: data, value: jsonEncode(obj.toJson())),
  ]);

  @override
  TypeGrammar generate(Column column) {
    if (column[data] != null) {
      return TypeGrammar.fromJson(jsonDecode(column[data]));
    }
    return TypeGrammar(0, "name");
  }

  @override
  Key get key => Key(nameColumn: id);

  @override
  String get tableName => "TypeGrammarTable";

}

/*  Bảng cấu trúc ngữ pháp */
class GrammaticalStructureTable extends TableSchema<GrammaticalStructure> {
  static const String id = "id";
  static const String data = "data";
  static const String idGrammar = "idGrammar";

  @override
  Columns columns(GrammaticalStructure obj) => columnBuild(addColumn: [
    column(name: id, value: obj.id),
    column(name: data, value: jsonEncode(obj.toJson())),
    column(name: idGrammar, value: obj.grammarId),
  ]);

  @override
  GrammaticalStructure generate(Column column) {
    if (column[data] != null) {
      return GrammaticalStructure.fromJson(jsonDecode(column[data]));
    }
    return GrammaticalStructure(0, '', '', 0);
  }

  @override
  Key get key => Key(nameColumn: id);

  @override
  String get tableName => "GrammaticalStructureTable";
}

/*  Bảng chủ đề chính */
class ExerciseGrammarTable extends TableSchema<ExerciseGrammar> {
  static const String id = "id";
  static const String data = "data";
  static const String idGrammaticalStructure = "idGrammaticalStructure";

  @override
  Columns columns(ExerciseGrammar obj) => columnBuild(addColumn: [
    column(name: id, value: 0),
    column(name: data, value: jsonEncode(obj.toJson())),
    column(name: idGrammaticalStructure, value: obj.grammaticalStructureId),
  ]);

  @override
  ExerciseGrammar generate(Column column) {
    if (column[data] != null) {
      return ExerciseGrammar.fromJson(jsonDecode(column[data]));
    }
    return ExerciseGrammar(0, CustomQuiz('', [], '', TypeQuiz.sound));
  }

  @override
  Key get key => Key(nameColumn: id, autoIncrement: true);

  @override
  String get tableName => "ExerciseGrammarTable";
}