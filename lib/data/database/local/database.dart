
import '../../../a_librarys/vip_sqflite/database_vip.dart';

///===  Hàm khởi tạo database    ===
DatabaseApp initdatabase() {
  return DatabaseApp(
      name: 'data',
      version: 1,
      tableSchemas: []
  );
}
