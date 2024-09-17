
/*  Model */
import 'package:lap_english/a_code_test/daonhutrieu/bloc_test/database/database.dart';
import 'package:lap_english/a_librarys/vip_sqflite/BaseDatabase.dart';
import 'package:lap_english/a_librarys/vip_sqflite/Database.dart';
import 'package:lap_english/data/database/Database.dart';

class Student {
  int msv;
  String name;
  int age;

  Student(this.msv, this.name, this.age);
}

/*  Table */
class StudentTable extends TableSchema<Student> {
  @override
  Columns columns(Student obj) => ColumnBuild(addColumn: [
    column(name: 'msv', value: obj.msv),
    column(name: 'name', value: obj.name),
    column(name: 'age', value: obj.age),
  ]);

  @override
  Student generate(Column column) => Student(
      column['msv'] ?? 0,
      column['name'] ?? '',
      column['age'] ?? 0,
  );

  @override
  Key get key => Key(nameColumn: 'msv', autoIncrement: true);

  @override
  String get tableName => 'studentb';

}

/*  DB   */
class StudentDB extends BaseDatabase<Student> {
  @override
  DatabaseApp get database => initdb();

  @override
  TableSchema<Student> get table => StudentTable();

  deleteAll() => query('DELETE FROM ${table.tableName}');

}