import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN GET ALL NASONI
Future<List<GetAllNasoniRow>> performGetAllNasoni(
  Database database,
) {
  final query = '''
select * from nasoni
''';
  return _readQuery(database, query, (d) => GetAllNasoniRow(d));
}

class GetAllNasoniRow extends SqliteRow {
  GetAllNasoniRow(Map<String, dynamic> data) : super(data);

  int? get id => data['id'] as int?;
  String? get addressText => data['addressText'] as String?;
  double? get latitude => data['latitude'] as double?;
  double? get longitude => data['Longitude'] as double?;
}

/// END GET ALL NASONI

/// BEGIN GET NASONI BY ID
Future<List<GetNasoniByIdRow>> performGetNasoniById(
  Database database, {
  int? queryId,
}) {
  final query = '''
SELECT *
FROM nasoni
WHERE id = ${queryId}
''';
  return _readQuery(database, query, (d) => GetNasoniByIdRow(d));
}

class GetNasoniByIdRow extends SqliteRow {
  GetNasoniByIdRow(Map<String, dynamic> data) : super(data);

  int? get id => data['id'] as int?;
  String? get addressText => data['addressText'] as String?;
  double? get latitude => data['latitude'] as double?;
  double? get longitude => data['Longitude'] as double?;
}

/// END GET NASONI BY ID

/// BEGIN GET ALL BANGLA
Future<List<GetAllBanglaRow>> performGetAllBangla(
  Database database,
) {
  final query = '''
select * from bangla
''';
  return _readQuery(database, query, (d) => GetAllBanglaRow(d));
}

class GetAllBanglaRow extends SqliteRow {
  GetAllBanglaRow(Map<String, dynamic> data) : super(data);

  int? get id => data['id'] as int?;
  String? get addressText => data['addressText'] as String?;
  double? get latitude => data['latitude'] as double?;
  double? get longitude => data['Longitude'] as double?;
  String? get orario => data['orario'] as String?;
  String? get city => data['city'] as String?;
}

/// END GET ALL BANGLA

/// BEGIN GET BANGLA BY ID
Future<List<GetBanglaByIdRow>> performGetBanglaById(
  Database database, {
  int? queryId,
}) {
  final query = '''
SELECT *
FROM bangla
WHERE id = ${queryId}
''';
  return _readQuery(database, query, (d) => GetBanglaByIdRow(d));
}

class GetBanglaByIdRow extends SqliteRow {
  GetBanglaByIdRow(Map<String, dynamic> data) : super(data);

  int? get id => data['id'] as int?;
  String? get addressText => data['addressText'] as String?;
  double? get latitude => data['latitude'] as double?;
  double? get longitude => data['Longitude'] as double?;
  String? get orario => data['orario'] as String?;
}

/// END GET BANGLA BY ID

/// BEGIN GET CIBO BY ID
Future<List<GetCiboByIdRow>> performGetCiboById(
  Database database, {
  int? queryId,
}) {
  final query = '''
SELECT *
FROM cibo
WHERE id = ${queryId}
''';
  return _readQuery(database, query, (d) => GetCiboByIdRow(d));
}

class GetCiboByIdRow extends SqliteRow {
  GetCiboByIdRow(Map<String, dynamic> data) : super(data);

  int? get id => data['id'] as int?;
  String? get addressText => data['addressText'] as String?;
  double? get latitude => data['latitude'] as double?;
  double? get longitude => data['Longitude'] as double?;
  String? get titolo => data['titolo'] as String?;
  String? get descrizione => data['descrizione'] as String?;
  String? get icon => data['icon'] as String?;
  int? get zozzoni => data['zozzoni'] as int?;
}

/// END GET CIBO BY ID

/// BEGIN GET ALL CIBO
Future<List<GetAllCiboRow>> performGetAllCibo(
  Database database,
) {
  final query = '''
select * from cibo
''';
  return _readQuery(database, query, (d) => GetAllCiboRow(d));
}

class GetAllCiboRow extends SqliteRow {
  GetAllCiboRow(Map<String, dynamic> data) : super(data);

  int? get id => data['id'] as int?;
  String? get addressText => data['addressText'] as String?;
  double? get latitude => data['latitude'] as double?;
  double? get longitude => data['Longitude'] as double?;
  String? get titolo => data['titolo'] as String?;
  String? get descrizione => data['descrizione'] as String?;
  String? get icon => data['icon'] as String?;
  int? get zozzoni => data['zozzoni'] as int?;
}

/// END GET ALL CIBO

/// BEGIN GET ALL CIBO BY ZOZZONI
Future<List<GetAllCiboByZozzoniRow>> performGetAllCiboByZozzoni(
  Database database, {
  int? queryZozzoni,
}) {
  final query = '''
select * 
from cibo 
where zozzoni = ${queryZozzoni}
''';
  return _readQuery(database, query, (d) => GetAllCiboByZozzoniRow(d));
}

class GetAllCiboByZozzoniRow extends SqliteRow {
  GetAllCiboByZozzoniRow(Map<String, dynamic> data) : super(data);

  int? get id => data['id'] as int?;
  String? get addressText => data['addressText'] as String?;
  double? get latitude => data['latitude'] as double?;
  double? get longitude => data['Longitude'] as double?;
  String? get titolo => data['titolo'] as String?;
  String? get descrizione => data['descrizione'] as String?;
  String? get icon => data['icon'] as String?;
  int? get zozzoni => data['zozzoni'] as int?;
}

/// END GET ALL CIBO BY ZOZZONI
