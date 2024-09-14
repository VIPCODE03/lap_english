
//===   MODEL   ===
import 'package:lap_english/vip_sqflite/BaseDatabase.dart';
import 'package:lap_english/vip_sqflite/Database.dart';

import 'initdatabase.dart';

class Person {
    String name;
    int age;
    String adress;

    Person(this.name, this.age, this.adress);

    Person.isEmpty() : this('',0,'');
}

//===   TABLE   ===
class PersonTable extends TableSchema<Person> {
  @override
  Columns columns(Person obj) => ColumnBuild(addColumn: [
      column(name: "tên", value: obj.name),
      column(name: "tuổi", value: obj.age),
      column(name: "địa_chỉ", value: obj.adress)
  ]);

  @override
  Person generate(Column column) => Person(
          column["tên"] ?? "",
          column["tuổi"] ?? 0,
          column["địa_chỉ"] ?? ""
      );

  @override
  String get key => "tên";

  @override
  String get tableName => "person";

}

//===   DAO     ===
class PersonDao extends BaseDatabase<Person> {
  PersonDao() : super(initdatabase(), Person.isEmpty());

}