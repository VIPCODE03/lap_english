
import 'package:lap_english/a_code_test/daonhutrieu/bloc_test/model/Student.dart';
import 'package:lap_english/a_librarys/vip_sqflite/database_vip.dart';

DatabaseApp initdb() {
  return DatabaseApp(
      name: 'aaa',
      version: 3,
      tableSchemas: [
        StudentTable()
      ]
  );
}