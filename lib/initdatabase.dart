import 'package:lap_english/Student.dart';
import 'package:lap_english/vip_sqflite/Database.dart';

///===  Hàm khởi tạo database    ===
DatabaseApp initdatabase() {
  return DatabaseApp(
      name: 'data',
      version: 6,
      tableSchemas: [
        StudentTable(),
      ]
  );
}
