
import 'package:lap_english/vip_sqflite/BaseDatabase.dart';
import 'package:lap_english/vip_sqflite/Database.dart';

import 'initdatabase.dart';

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
  StudentDB() : super(initdatabase(), StudentTable());

  xoa() => query('DELETE FROM student');
}