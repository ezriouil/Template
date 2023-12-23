import 'package:sqflite/sqflite.dart';
import 'package:test1/data/models/location_address.dart';
import 'package:test1/data/models/product.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';

class AppDatabase {
  static Database? _instance;
  final String _dbName = "${CustomTextStrings.APP_NAME}.db";

// - - - - - - - - - - - - - - - - - - INSTANCE FROM DATABASE- - - - - - - - - - - - - - - - - -  //
  Future<Database> get database async {
    if (_instance != null) {
      return _instance!;
    }
    return _instance = await _init();
  }

  // - - - - - - - - - - - - - - - - - - CREATE DATABASE - - - - - - - - - - - - - - - - - -  //
  Future<Database> _init() async {
    return await openDatabase(
      _dbName,
      onCreate: (db, version) {
        /*  YOUR ENTITIES */
        db.execute(LocationAddress.CREATE_TABLE);
        db.execute(Product.CREATE_TABLE);
      },
      version: CustomTextStrings.APP_NAME_VERSION,
    );
  }
}
