import 'package:lap_english/Person.dart';
import 'package:lap_english/vip_sqflite/Database.dart';

///===  Hàm khởi tạo database    ===
DatabaseApp initdatabase() {
  return DatabaseApp(
      name: 'aa',
      version: 4,
      tableSchemas: [
        PersonTable(),
      ]
  );
}
