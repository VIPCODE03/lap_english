
import 'package:lap_english/a_librarys/vip_sqflite/base_database_vip.dart';
import 'package:lap_english/a_librarys/vip_sqflite/database_vip.dart';
import 'package:lap_english/data/database/local/database.dart';
import 'package:lap_english/data/database/local/table/user_table.dart';
import 'package:lap_english/data/model/user/user.dart';

class UserDao extends BaseDatabase<User> {
  @override
  DatabaseApp get database => initdatabase();

  @override
  TableSchema<User> get table => UserTable();

}