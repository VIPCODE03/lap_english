
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

typedef Columns = Map<String, dynamic>;
typedef Column = Map<String, dynamic>;

/*  Class Table   */
abstract class TableSchema<T> {
  static const String primaryKey = 'keyID';

  Columns columns(T obj);
  String get tableName;
  T generate(Column column);
  Key get key;

  Column column({
    required String name,
    required dynamic value
  }) => {name: value};

  Columns columnBuild({required List<Column> addColumn}) {

    //---   Chuyển đổi column   ---
    Columns columnsB = {};
    for(Columns columns1 in addColumn) {
      columnsB.addAll(columns1);
    }

    return columnsB;
  }

}

/*  Class Key   */
class Key {
  final String _nameColumn;
  final bool _autoIncrement;

  Key({
    required String nameColumn,
    bool autoIncrement = false,
  })  : _nameColumn = nameColumn,
        _autoIncrement = autoIncrement;

  String get nameColumn => _nameColumn;
  bool get autoIncrement => _autoIncrement;
}

/*  Class Database  */
class DatabaseApp {
  late final String _name;
  late final int _version;
  late final List<TableSchema<dynamic>> _tableSchemas;

  String get name => _name;

  //-Constructor ------------------------------------/
  DatabaseApp({
    required String name,
    required int version,
    required List<TableSchema<dynamic>> tableSchemas,
  })
      : _name = name,
        _version = version,
        _tableSchemas = tableSchemas;


  //-Hàm khởi tạo basedatabase   ----------------------/
  bool isContainsTable<T>(TableSchema<T> table) {
    return _tableSchemas.any((tableSchema) => tableSchema.runtimeType == table.runtimeType);
  }

  //===   Hàm khởi tạo database   ===
  Future<Database?> initializeDatabase() async {
    if (!_validityCheck()) return null;
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, '$_name.db');

    final createTableStatements = _generateCreateTableStatements(_tableSchemas);

    return openDatabase(
      path,
      version: _version,

      //---   Tạo database nêú chưa khởi tạo    ---
      onCreate: (db, version) async {
        await db.transaction((txn) async {
          for (String query in createTableStatements) {
            await txn.execute(query);
          }
        });
      },

      //---   Xử lý khi thay đổi phiên bản    ---
      onUpgrade: (db, oldVersion, newVersion) async {
        if (newVersion > oldVersion) {
          final newCreateTableStatements = _generateCreateTableStatements(_tableSchemas);

          await db.transaction((txn) async {
            for (String query in newCreateTableStatements) {
              await txn.execute(query);
            }
          });
        }
      },
    );
  }

  //===   Hàm tạo bảng  ===
  List<String> _generateCreateTableStatements(List<TableSchema> schemas) {
    StringBuffer buffer;
    List<String> querys = [];

    for (var schema in schemas) {
      buffer = StringBuffer();
      buffer.writeln('CREATE TABLE IF NOT EXISTS ${schema.tableName} (');

      final columns = schema.columns(schema.generate({}));
      columns.forEach((name, type) {
        String columnType;

        if (type is int) {
          columnType = 'INTEGER';
        } else if (type is double) {
          columnType = 'REAL';
        } else {
          columnType = 'TEXT';
        }

        buffer.writeln('  $name $columnType,');
      });

      buffer.writeln('  ${TableSchema.primaryKey} INTEGER PRIMARY KEY AUTOINCREMENT');
      buffer.writeln(');');
      buffer.writeln();

      querys.add(buffer.toString());
    }

    return querys;
  }

  //===   Kiểm tra các giá trị rỗng hoặc lỗi  ===
  bool _validityCheck() {
    for (var schema in _tableSchemas) {
      final columns = schema.columns(schema.generate({}));

      if(columns.isEmpty) {
        throw ArgumentError('Columns is empty by ${schema.runtimeType}.');
      }
      if(schema.tableName == '') {
        throw ArgumentError('Table name cannot be empty by ${schema.runtimeType}.');
      }
      if(!columns.containsKey(schema.key.nameColumn) && schema.key.nameColumn != TableSchema.primaryKey ) {
        throw ArgumentError('No matching column found for key "${schema.key.nameColumn}" by ${schema.runtimeType}.');
      }
    }
    return true;
  }

}


