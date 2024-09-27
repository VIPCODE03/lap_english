
import 'package:lap_english/data/database/local/table/UserTable.dart';

import '../../../a_librarys/vip_sqflite/Database.dart';

///===  Hàm khởi tạo database    ===
DatabaseApp initdatabase() {
  return DatabaseApp(
      name: 'data',
      version: 1,
      tableSchemas: [
        UserTable(),
      ]
  );
}
