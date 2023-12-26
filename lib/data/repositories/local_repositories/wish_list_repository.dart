import 'package:sqflite/sqflite.dart';
import 'package:test1/data/models/product.dart';
import 'package:test1/utils/local/database/crud_operations.dart';

class WishListRepository {
  final Database _database;
  static int CODE_ERROR = CrudOperations.CODE_ERROR;

  WishListRepository(this._database);

// - - - - - - - - - - - - - - - - - - INSERT NEW WISHLIST - - - - - - - - - - - - - - - - - -  //
  Future<int> insertWishList(Product product) async {
    final resultCode = await CrudOperations.insert(
        database: _database,
        data: product.toJsonProductWishListLocal(),
        tableName: Product.TABLE_WISHLIST_NAME);
    return resultCode;
  }

// - - - - - - - - - - - - - - - - - - GET WISHLISTS - - - - - - - - - - - - - - - - - -  //
  Future<List<Product>?> getWishLists() async {
    final products = await CrudOperations.getAll(
        database: _database,
        tableName: Product.TABLE_WISHLIST_NAME,
        orderByDesc: true);
    if (products == null) return null;
    return products
        .map((product) => Product.fromJsonProductWishListLocal(product))
        .toList();
  }

// - - - - - - - - - - - - - - - - - - GET WISHLIST BY ID - - - - - - - - - - - - - - - - - -  //
  Future<Product?> getWishListById({required int id}) async {
    final product = await CrudOperations.get(
        database: _database,
        tableName: Product.TABLE_WISHLIST_NAME,
        columnName: Product.COLUMN_ID,
        whereIndex: id);
    if (product == null) return null;
    return Product.fromJsonProductWishListLocal(product);
  }

// - - - - - - - - - - - - - - - - - - UPDATE WISHLIST BY ID - - - - - - - - - - - - - - - - - -  //
  Future<int> updateWishListById({required Product product}) async {
    final codeResult = await CrudOperations.update(
        database: _database,
        tableName: Product.TABLE_WISHLIST_NAME,
        whereIndex: product.id,
        newData: product.toJsonProductWishListLocal(),
        columnWhere: Product.COLUMN_ID);
    return codeResult;
  }

// - - - - - - - - - - - - - - - - - - DELETE WISHLIST BY ID - - - - - - - - - - - - - - - - - -  //
  Future<int> deleteWishListById({required int id}) async {
    final codeResult = await CrudOperations.delete(
        database: _database,
        tableName: Product.TABLE_WISHLIST_NAME,
        whereIndex: id,
        columnWhere: Product.COLUMN_ID);
    return codeResult;
  }

// - - - - - - - - - - - - - - - - - - DELETE ALL WISHLISTS - - - - - - - - - - - - - - - - - -  //
//   Future<int> deleteWishLists() async {
//     final codeResult = await CrudOperations.deleteAll(
//         database: _database, tableName: Product.TABLE_NAME);
//     return codeResult;
//   }
}
