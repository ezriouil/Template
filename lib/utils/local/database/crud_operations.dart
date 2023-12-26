import 'package:sqflite/sqflite.dart';

class CrudOperations {
  CrudOperations._();

  // - - - - - - - - - - - - - - - - - - VARIABLES - - - - - - - - - - - - - - - - - -  //

  static const int CODE_ERROR = 404;

  // - - - - - - - - - - - - - - - - - - INSERT - - - - - - - - - - - - - - - - - -  //

  static Future<int> insert(
      {required Database database,
      required Map<String, dynamic> data,
      required String tableName}) async {
    try {
      final codeResult = await database.insert(tableName, data,
          conflictAlgorithm: ConflictAlgorithm.replace);
      return codeResult;
    } catch (_) {
      return CODE_ERROR;
    }
  }

  // - - - - - - - - - - - - - - - - - - GET ALL - - - - - - - - - - - - - - - - - -  //

  static Future<List<Map<String, dynamic>>?> getAll(
      {required Database database,
      required String tableName,
      required bool orderByDesc}) async {
    try {
      final List<Map<String, dynamic>> data = await database.rawQuery(
        "SELECT * FROM $tableName",
      );
      return data.isEmpty ? List.empty() : data;
    } catch (_) {
      return null;
    }
  }

  // - - - - - - - - - - - - - - - - - - GET ITEM - - - - - - - - - - - - - - - - - -  //

  static Future<Map<String, dynamic>?> get(
      {required Database database,
      required String tableName,
      required String columnName,
      required dynamic whereIndex}) async {
    try {
      final List<Map<String, dynamic>> data = await database.query(tableName,
          where: '$columnName = ?', whereArgs: [whereIndex], limit: 1);
      return data.isEmpty ? null : data.first;
    } catch (_) {
      return null;
    }
  }

  // - - - - - - - - - - - - - - - - - - UPDATE - - - - - - - - - - - - - - - - - -  //

  static Future<int> update(
      {required Database database,
      required String tableName,
      required Map<String, dynamic> newData,
      required String columnWhere,
      required dynamic whereIndex}) async {
    try {
      final resultCode = await database.update(
        tableName,
        newData,
        where: "$columnWhere = ?",
        whereArgs: [whereIndex.toString()],
      );
      return resultCode;
    } catch (_) {
      return CODE_ERROR;
    }
  }

  // - - - - - - - - - - - - - - - - - - DELETE - - - - - - - - - - - - - - - - - -  //

  static Future<int> delete(
      {required Database database,
      required String tableName,
      required String columnWhere,
      required dynamic whereIndex}) async {
    try {
      final codeResult = await database.delete(
        tableName,
        where: "$columnWhere = ?",
        whereArgs: [whereIndex],
      );
      return codeResult;
    } catch (_) {
      return CODE_ERROR;
    }
  }

// - - - - - - - - - - - - - - - - - - DELETE ALL - - - - - - - - - - - - - - - - - -  //

// static Future<int> deleteAll({
//   required Database database,
//   required String tableName,
// }) async {
//   try {
//     final codeResult = await database.rawDelete("DELETE FORM $tableName");
//     return codeResult;
//   } catch (_) {
//     return CODE_ERROR;
//   }
// }
}
