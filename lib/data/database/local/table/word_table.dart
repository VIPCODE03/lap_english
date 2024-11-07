//
// import 'package:lap_english/a_librarys/vip_sqflite/database_vip.dart';
// import 'package:lap_english/data/model/learn/vocabulary.dart';
//
// class WordTable extends TableSchema<Word> {
//   final String _id = "id";
//   final String _idSubtopic = "idSubtopic";
//   final String _data = "data";
//
//   @override
//   Columns columns(Word obj) => ColumnBuild(addColumn: [
//     column(name: _id, value: null),
//     column(name: _data, value: obj.toJson()),
//     column(name: _idSubtopic, value: obj.idSubtopic),
//   ]);
//
//   @override
//   Word generate(Column column) => Word.fromJson(column[_data]);
//
//   @override
//   Key get key => Key(nameColumn: _id, autoIncrement: true);
//
//   @override
//   String get tableName => "words";
//
// }