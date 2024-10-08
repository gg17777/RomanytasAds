import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'roma_4_1',
      'romaDB.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<GetAllNasoniRow>> getAllNasoni() => performGetAllNasoni(
        _database,
      );

  Future<List<GetNasoniByIdRow>> getNasoniById({
    int? queryId,
  }) =>
      performGetNasoniById(
        _database,
        queryId: queryId,
      );

  Future<List<GetAllBanglaRow>> getAllBangla() => performGetAllBangla(
        _database,
      );

  Future<List<GetBanglaByIdRow>> getBanglaById({
    int? queryId,
  }) =>
      performGetBanglaById(
        _database,
        queryId: queryId,
      );

  Future<List<GetCiboByIdRow>> getCiboById({
    int? queryId,
  }) =>
      performGetCiboById(
        _database,
        queryId: queryId,
      );

  Future<List<GetAllCiboRow>> getAllCibo() => performGetAllCibo(
        _database,
      );

  Future<List<GetAllCiboByZozzoniRow>> getAllCiboByZozzoni({
    int? queryZozzoni,
  }) =>
      performGetAllCiboByZozzoni(
        _database,
        queryZozzoni: queryZozzoni,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  /// END UPDATE QUERY CALLS
}
