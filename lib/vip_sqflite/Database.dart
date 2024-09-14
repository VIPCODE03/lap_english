import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

typedef Columns = Map<String, dynamic>;
typedef Column = Map<String, dynamic>;

abstract class TableSchema<T> {
  static const String primaryKey = 'ID';

  Columns columns(T obj);
  String get tableName;
  String get key;
  T generate(Column column);

  Column column({
    required String name,
    required dynamic value
  }) => {name: value};

  Columns ColumnBuild({required List<Column> addColumn}) {
    Columns columnsB = {};
    for(Columns columns1 in addColumn) {
      columnsB.addAll(columns1);
    }
    return columnsB;
  }
}

class DatabaseApp {
  late final String _name;
  late final int _version;
  late final List<TableSchema<dynamic>> _tableSchemas;

  DatabaseApp({
    required String name,
    required int version,
    required List<TableSchema<dynamic>> tableSchemas,
  })
      : _name = name,
        _version = version,
        _tableSchemas = tableSchemas;

  TableSchema<T>? getTableSchema<T>(T obj) {
    for (var schema in _tableSchemas) {
      if (schema is TableSchema<T>) {
        return schema;
      }
    }
    return null;
  }

  Future<Database?> initializeDatabase() async {
    if(!_validityCheck()) return null;
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, '$_name.db');

    final createTableStatements = generateCreateTableStatements(_tableSchemas);

    return openDatabase(
      path,
      onCreate: (db, version) async {
        await db.transaction((txn) async {
          for(String query in createTableStatements) {
            await txn.execute(query);
          }
        });
      },
      version: _version,
    );
  }

  List<String> generateCreateTableStatements(List<TableSchema> schemas) {
    StringBuffer buffer;
    List<String> querys = [];

    for (var schema in schemas) {
      buffer = StringBuffer();
      buffer.writeln('CREATE TABLE ${schema.tableName} (');

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

      buffer.writeln('  ID INTEGER PRIMARY KEY AUTOINCREMENT');
      buffer.writeln(');');
      buffer.writeln();

      querys.add(buffer.toString());
    }

    return querys;
  }

  bool _validityCheck() {
    for (var schema in _tableSchemas) {
      final columns = schema.columns(schema.generate({}));
      if(columns.isEmpty) {
        throw ArgumentError('Columns is empty by ${schema.runtimeType}.');
      }
      if(schema.tableName == '') {
        throw ArgumentError('Table name cannot be empty by ${schema.runtimeType}.');
      }
      if(!columns.containsKey(schema.key) && schema.key != TableSchema.primaryKey ) {
        throw ArgumentError('No matching column found for key "${schema.key}" by ${schema.runtimeType}.');
      }
    }
    return true;
  }

}


