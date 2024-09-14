import 'dart:core';

import 'package:sqflite/sqflite.dart';

import 'Database.dart';

abstract class BaseDatabase<T> {
  late Future<Database?> _database;
  late TableSchema<T> _table;
  final T _obj;

  BaseDatabase(DatabaseApp db, this._obj) {
    _database = db.initializeDatabase();
    _table = db.getTableSchema(_obj)!;
  }

  //===   insert    ===
  Future<bool> insert(T obj) async {
    try {
      if(await _checkExist(obj)) return false;
      final db = await _database;
      await db?.insert(
        _table.tableName,
        _table.columns(obj),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return true;
    }
    catch(e) {
      print("Error insert: $e");
      return false;
    }
  }

  //===   update  ===
  Future<bool> update(T oldObj, T newObj) async {
    try {
      final db = await _database;
      await db?.update(
        _table.tableName,
        _table.columns(newObj),
        where: '${_table.key} = ?',
        whereArgs: [_table.columns(oldObj)[_table.key]],
      );
      return true;
    }
    catch(e) {
      print("Error update: $e");
      return false;
    }
  }

  //===   delete    ===
  Future<bool> delete(T obj) async {
    try {
      final db = await _database;
      await db?.delete(
        _table.tableName,
        where: '${_table.key} = ?',
        whereArgs: [_table.columns(obj)[_table.key]],
      );
      return true;
    }
    catch(e) {
      print("Error delete: $e");
      return false;
    }
  }

  //===   Lấy tất cả dữ liệu    ===
  Future<List<T>> getAll({required bool firstToLast}) async {
    final db = await _database;
    final List<Map<String, Object?>>? datas;
    if(firstToLast) {
      datas = await db?.query(_table.tableName);
    } else {
      datas = await db?.query(_table.tableName, orderBy: 'ID DESC',);
    }
    return _generate(datas!);
  }

  //===   Lấy dữ liệu theo trang  ===
  Future<List<T>> getPageData({required int index, required int limit, required bool firstToLast}) async {
    final db = await _database;
    final offset = (index - 1) * limit;

    final List<Map<String, Object?>>? datas;
    if(firstToLast) {
      datas = await db?.query(_table.tableName, limit: limit, offset: offset);
    } else {
      datas = await db?.query(_table.tableName, orderBy: 'ID DESC', limit: limit, offset: offset);
    }
    return _generate(datas!);
  }

  //===   Lấy tổng số bản ghi   ===
  Future<int> getCount() async {
    final db = await _database;
    List<Map<String, Object?>>? result = await db?.rawQuery('SELECT COUNT(*) AS count FROM ${_table.tableName}');
    int count = Sqflite.firstIntValue(result!) ?? 0;
    return count;
  }

  //===   Truy vấn theo query   ===
  Future<List<T>> query(String query, [List<dynamic>? args]) async {
    final db = await _database;
    List<Map<String, Object?>>? datas = await db?.rawQuery(query, args);

    if(datas!.isEmpty && query.toUpperCase().contains('INSERT') || query.toUpperCase().contains('UPDATE')) {
      final check = await _CheckNewlyAddedRecords();
      if(check) {
        return _generate(datas);
      }
    }
    return _generate(datas);
  }

  //===   Kiểm tra tồn tại 2 bản ghi và xóa ===
  Future<bool> _CheckNewlyAddedRecords() async {
    final newly = await getPageData(index: 1, limit: 1, firstToLast: false);
    T obj = newly[0];
    Column column = _table.columns(obj);
    final keyValue = column[_table.key];
    final ids = await _getIdsByKey(keyValue);
    if(ids.length >= 2) {
      print('Record already exists by key ${_table.key} = $keyValue');
      final db = await _database;
      await db?.delete(
        _table.tableName,
        where: 'ID = ?',
        whereArgs: [ids[1]]
      );
      return true;
    }
    return false;
  }

  //===   Kiểm tra tồn tại  ===
  Future<bool> _checkExist(T obj) async {
    final db = await _database;
    Column column = _table.columns(obj);
    dynamic value = column[_table.key];
    List<Map<String, Object?>>? result = await db?.rawQuery('SELECT COUNT(*) FROM ${_table.tableName} WHERE ${_table.key} = ?;',[value]);
    final count = Sqflite.firstIntValue(result!) ?? 0;
    if(count >= 1) {
      print('Record already exists by key ${_table.key} = $value');
      return true;
    }
    return false;
  }

  //===   Lấy toàn bộ id bởi các key   ===
  Future<List<int>> _getIdsByKey(dynamic keyValue) async {
    final db = await _database;
    final result = await db?.rawQuery(
      'SELECT ID FROM ${_table.tableName} WHERE ${_table.key} = ?',
      [keyValue],
    );

    return result?.map<int>((row) => row['ID'] as int).toList() ?? [];
  }

  //===   Tạo dữ liệu   ===
  List<T> _generate(List<Map<String, dynamic>> datas) {
    List<Map<String, dynamic>> processedData = [];

    for (Map<String, dynamic> data in datas) {
      final Map<String, dynamic> mutableData = Map.from(data);

      mutableData.forEach((key, value) {
        mutableData[key] = _parseValue(_table.columns(_obj)[key].runtimeType, value);
      });

      processedData.add(mutableData);
    }

    if (processedData.isNotEmpty) {
      return List.generate(processedData.length, (i) => _table.generate(processedData[i]));
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

}
