
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import 'database_vip.dart';

abstract class BaseDatabase<T> {
  late Future<Database?> _database;

  DatabaseApp get database;
  TableSchema<T> get table;
  final Map<int, int> _mapDatas = {};

  BaseDatabase() {
    if(database.isContainsTable(table)) {
      _database = database.initializeDatabase();
    }
    else {
      throw ArgumentError('Table ${table.runtimeType} not found in database ${database.name}');
    }
  }

  /*  Các hàm truy vấn  *********************************************************/

  //===   insert    ===
  Future<bool> insert(T obj)  async {
    try {
        if(!table.key.autoIncrement && await _checkExist(obj)) {
            return update(obj);
        }
        var columns = await _autoIncrement(table.columns(obj));

        final db = await _database;
        await db?.insert(
          table.tableName,
          columns,
        );

        return true;
      }
      catch(e) {
        if (kDebugMode) print("Error insert: $e");
        return false;
      }
  }

  //===   update  ===
  Future<bool> update(T obj) async {
    try {
      var keyID = _mapDatas[obj.hashCode];
      final db = await _database;
      await db?.update(
        table.tableName,
        table.columns(obj),
        where: keyID != null
            ? '${TableSchema.primaryKey} = ?'
            : '${table.key.nameColumn} = ?'
        ,
        whereArgs: keyID != null ? [keyID] : [table.columns(obj)[table.key.nameColumn]],
      );
      return true;
    }
    catch(e) {
      if (kDebugMode) print("Error update: $e");
      return false;
    }
  }

  //===   delete    ===
  Future<bool> delete(T obj) async {
    try {
      if(await _checkExist(obj)) {
        var keyID = _mapDatas[obj.hashCode];
        final db = await _database;
        await db?.delete(
          table.tableName,
          where: '${TableSchema.primaryKey} = ?',
          whereArgs: [keyID],
        );
        return true;
      }
      return false;
    }
    catch(e) {
      if (kDebugMode) print("Error delete: $e");
      return false;
    }
  }

  //===   Lấy tất cả dữ liệu    ===
  Future<List<T>> getData({
    bool firstToLast = false,
    int? limit,
    int? index,
  }
) async {
    final db = await _database;
    final List<Map<String, Object?>>? datas;

    if(index == null || limit == null) {
      if(firstToLast) {
        datas = await db?.query(table.tableName);
      }
      else {
        datas = await db?.query(table.tableName, orderBy: '${TableSchema.primaryKey} DESC');
      }
    }
    else {
      final offset = (index - 1) * limit;

      if (firstToLast) {
        datas = await db?.query(table.tableName, limit: limit, offset: offset);
      }
      else {
        datas = await db?.query(table.tableName, orderBy: '${TableSchema.primaryKey} DESC', limit: limit, offset: offset);
      }
    }
    return _generate(datas!);
  }

  //===   Lấy tổng số bản ghi   ===
  Future<int> getCount() async {
    final db = await _database;
    List<Map<String, Object?>>? result = await db?.rawQuery('SELECT COUNT(*) AS count FROM ${table.tableName}');
    int count = Sqflite.firstIntValue(result!) ?? 0;
    return count;
  }

  //===   Truy vấn theo query   ===
  Future<List<T>> query(String query, [List<dynamic>? args]) async {
    final db = await _database;
    List<Map<String, Object?>>? datas = await db?.rawQuery(query, args);

    if(datas!.isEmpty && query.toUpperCase().contains('INSERT') || query.toUpperCase().contains('UPDATE')) {
      final check = await _checkNewlyAddedRecords();
      if(check) {
        return _generate(datas);
      }
    }
    return _generate(datas);
  }

  /*  Hàm kiểm tra và khởi tạo dữ liệu  ****************************************/

  //===   Kiểm tra tồn tại 2 bản ghi và xóa ===
  Future<bool> _checkNewlyAddedRecords() async {
    final newly = await getData(index: 1, limit: 1, firstToLast: false);
    T obj = newly[0];
    Column column = table.columns(obj);
    final keyValue = column[table.key.nameColumn];
    final ids = await _getIdsByKey(keyValue);
    if(ids.length >= 2) {
      if (kDebugMode) {
        print('Record already exists by key ${table.key} = $keyValue');
      }
      final db = await _database;
      await db?.delete(
          table.tableName,
        where: '${TableSchema.primaryKey} = ?',
        whereArgs: [ids[1]]
      );
      return true;
    }
    return false;
  }

  //===   Kiểm tra tồn tại  ===
  Future<bool> _checkExist(T obj) async {
    final db = await _database;
    Column column = table.columns(obj);
    dynamic value = column[table.key.nameColumn];
    List<Map<String, Object?>>? result = await db?.rawQuery('SELECT COUNT(*) FROM ${table.tableName} WHERE ${table.key.nameColumn} = ?;',[value]);
    final count = Sqflite.firstIntValue(result!) ?? 0;
    if(count >= 1) {
      if (kDebugMode) {
        print('Record already exists by key ${table.key} = $value');
      }
      return true;
    }
    return false;
  }

  //===   Lấy toàn bộ id bởi các key   ===
  Future<List<int>> _getIdsByKey(dynamic keyValue) async {
    final db = await _database;
    final result = await db?.rawQuery(
      'SELECT ${TableSchema.primaryKey} FROM ${table.tableName} WHERE ${table.key} = ?',
      [keyValue],
    );

    return result?.map<int>((row) => row[TableSchema.primaryKey] as int).toList() ?? [];
  }

  //===   Tạo dữ liệu   ===
  List<T> _generate(List<Map<String, dynamic>> datas) {
    List<Map<String, dynamic>> processedData = [];
    _mapDatas.clear();

    for (Map<String, dynamic> data in datas) {
      final mutableData = {...data};

      mutableData.forEach((key, value) {
        if (key != TableSchema.primaryKey) {
          mutableData[key] = _parseValue(table.columns(table.generate({}))[key].runtimeType, value);
        }
      });

      processedData.add(mutableData);
    }

    if (processedData.isNotEmpty) {
      return List.generate(processedData.length, (i) {
        final T object = table.generate(processedData[i]);
        _mapDatas[object.hashCode] = processedData[i][TableSchema.primaryKey];
        return object;
      });
    } else {
      return [];
    }
  }

  //===   Chuyển đổi dữ liệu    ===
  dynamic _parseValue(Type type, dynamic value) {
    if (type == int) {
      return value is int ? value : int.tryParse(value.toString()) ?? 0;
    } else if (type == double) {
      return value is double ? value : double.tryParse(value.toString()) ?? 0.0;
    } else if (type == bool) {
      return value is bool ? value : (int.tryParse(value.toString()) == 1) ? true : false;
    } else if (type == String) {
      return value is String ? value : value.toString();
    }
  }

  //===   Tăng dữ liệu id thêm 1  ===
  Future<Columns> _autoIncrement(Columns columns) async {
    final db = await _database;
    if(table.key.autoIncrement) {
      if(columns[table.key.nameColumn] is int) {
        int iD = 0;
        List<Map<String, Object?>>? result = await db?.query(
          table.tableName,
          columns: [(TableSchema.primaryKey)],
          orderBy: "${TableSchema.primaryKey} DESC",
          limit: 1,
        );

        if (result!.isNotEmpty) {
          iD = result.first[TableSchema.primaryKey] as int;
        }
        iD++;

        columns[table.key.nameColumn] = iD;
      }
      else {
        throw ArgumentError('Cannot use autoincrement for type ${columns[table.key.nameColumn].runtimeType}');
      }
    }
    return columns;
  }

}
