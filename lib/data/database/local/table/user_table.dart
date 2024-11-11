
import 'dart:convert';

import 'package:lap_english/a_data_test/data_user_test.dart';
import 'package:lap_english/a_librarys/vip_sqflite/database_vip.dart';
import 'package:lap_english/data/model/user/user.dart';

class UserTable extends TableSchema<User> {
  static const String data = "data";
  static const String email = "email";

  @override
  Columns columns(User obj) => columnBuild(addColumn: [
    column(name: data, value: jsonEncode(obj.toJson())),
    column(name: email, value: obj.email),
  ]);

  @override
  User generate(Column column) {
    if(column[data] != null) {
      return User.fromJson(jsonDecode(column[data]));
    }
    return generateUser().first;
  }

  @override
  Key get key => Key(nameColumn: email);

  @override
  String get tableName => 'UserTable';
}