
import 'package:lap_english/a_code_test/daonhutrieu/bloc_test/model/Student.dart';
import 'package:lap_english/a_librarys/vip_sqflite/Database.dart';

DatabaseApp initdb() {
  return DatabaseApp(
      name: 'ahihi',
      version: 1,
      tableSchemas: [
        StudentTable()
      ]
  );
}