
import '../../a_librarys/vip_sqflite/BaseDatabase.dart';
import '../../a_librarys/vip_sqflite/Database.dart';
import '../database/Database.dart';

class Student {
  String name;
  int age;
  String class_;

  Student(this.name, this.age, this.class_);

}

class StudentTable extends TableSchema<Student> {
  @override
  Columns columns(Student obj) => ColumnBuild(addColumn: [
    column(name: 'tên', value: obj.name),
    column(name: 'lớp', value: obj.class_),
    column(name: 'tuổi', value: obj.age),
  ]);

  @override
  Student generate(Column column) => Student(
    column['tên'] ?? '',
    column['tuổi'] ?? 0,
    column['lớp'] ?? '',
  );

  @override
  String get tableName => 'student';

  @override
  Key get key => Key(nameColumn: 'tuổi', autoIncrement: true);

}


class StudentDB extends BaseDatabase<Student> {

  @override
  DatabaseApp get database => initdatabase();

  @override
  TableSchema<Student> get table => StudentTable();

  xoa() => query('DELETE FROM ${table.tableName}');

  timkiemtheoten(String name) => query('SELECT * FROM ${table.tableName} WHERE tên LIKE ?', ['%$name%']);


}