
import 'package:lap_english/data/models/Student.dart';
import '../../a_librarys/vip_sqflite/Database.dart';

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
