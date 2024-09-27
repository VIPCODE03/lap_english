
import 'package:lap_english/a_librarys/vip_sqflite/BaseDatabase.dart';
import 'package:lap_english/a_librarys/vip_sqflite/Database.dart';
import 'package:lap_english/data/database/local/Database.dart';
import 'package:lap_english/data/database/local/table/UserTable.dart';
import 'package:lap_english/data/model/User.dart';

class UserDao extends BaseDatabase<User> {
  @override
  DatabaseApp get database => initdatabase();

  @override
  TableSchema<User> get table => UserTable();

}