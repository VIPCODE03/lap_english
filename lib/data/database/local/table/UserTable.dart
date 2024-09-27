
import 'package:lap_english/a_librarys/vip_sqflite/Database.dart';
import 'package:lap_english/data/model/User.dart';

class UserTable extends TableSchema<User> {
  @override
  Columns columns(User obj) => ColumnBuild(addColumn: [
    column(name: 'email', value: obj.email),
    column(name: 'password', value: obj.password)
  ]);

  @override
  User generate(Column column) => User.local(
    column['email'],
    column['password']
  );

  @override
  Key get key => Key(nameColumn: 'email');

  @override
  String get tableName => 'user';
}