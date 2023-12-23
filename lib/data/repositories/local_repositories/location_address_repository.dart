import 'package:sqflite/sqflite.dart';
import 'package:test1/data/models/location_address.dart';
import 'package:test1/utils/local/database/crud_operations.dart';

class LocationAddressRepository {
  final Database _database;
  static int CODE_ERROR = CrudOperations.CODE_ERROR;

  LocationAddressRepository(this._database);

// - - - - - - - - - - - - - - - - - - INSERT NEW ADDRESS - - - - - - - - - - - - - - - - - -  //
  Future<int> insertAddress(LocationAddress locationAddress) async {
    final resultCode = await CrudOperations.insert(
        database: _database,
        data: locationAddress.toJson(),
        tableName: LocationAddress.TABLE_NAME);
    return resultCode;
  }

// - - - - - - - - - - - - - - - - - - GET ADDRESSES - - - - - - - - - - - - - - - - - -  //
  Future<List<LocationAddress>?> getLocationAddresses() async {
    final addresses = await CrudOperations.getAll(
        database: _database,
        tableName: LocationAddress.TABLE_NAME,
        orderByDesc: true);
    if (addresses == null) return null;
    return addresses
        .map((address) => LocationAddress.fromJson(address))
        .toList();
  }

// - - - - - - - - - - - - - - - - - - GET ADDRESS BY ID - - - - - - - - - - - - - - - - - -  //
  Future<LocationAddress?> getLocationAddressById({required int id}) async {
    final address = await CrudOperations.get(
        database: _database,
        tableName: LocationAddress.TABLE_NAME,
        columnName: LocationAddress.COLUMN_ID,
        whereIndex: id);
    if (address == null) return null;
    return LocationAddress.fromJson(address);
  }

// - - - - - - - - - - - - - - - - - - UPDATE ADDRESS BY ID - - - - - - - - - - - - - - - - - -  //
  Future<int> updateLocationAddressById(
      {required int id, required LocationAddress localizationAddress}) async {
    final codeResult = await CrudOperations.update(
        database: _database,
        tableName: LocationAddress.TABLE_NAME,
        whereIndex: id,
        newData: localizationAddress.toJson(),
        columnWhere: LocationAddress.COLUMN_ID);
    return codeResult;
  }

// - - - - - - - - - - - - - - - - - - DELETE ADDRESS BY ID - - - - - - - - - - - - - - - - - -  //
  Future<int> deleteLocationAddressById({required int id}) async {
    final codeResult = await CrudOperations.delete(
        database: _database,
        tableName: LocationAddress.TABLE_NAME,
        whereIndex: id,
        columnWhere: LocationAddress.COLUMN_ID);
    return codeResult;
  }

// - - - - - - - - - - - - - - - - - - DELETE ALL ADDRESSES - - - - - - - - - - - - - - - - - -  //
//   Future<int> deleteLocationAddresses() async {
//     final codeResult = await CrudOperations.deleteAll(
//         database: _database, tableName: LocationAddress.TABLE_NAME);
//     return codeResult;
//   }
}
