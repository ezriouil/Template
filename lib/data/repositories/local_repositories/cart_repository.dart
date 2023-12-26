import 'package:sqflite/sqflite.dart';
import 'package:test1/data/models/product.dart';
import 'package:test1/utils/local/database/crud_operations.dart';

class CartRepository {
  final Database _database;
  static int CODE_ERROR = CrudOperations.CODE_ERROR;

  CartRepository(this._database);

// - - - - - - - - - - - - - - - - - - INSERT NEW PRODUCT TO CART - - - - - - - - - - - - - - - - - -  //
  Future<int> insertToCart(Product product) async {
    final resultCode = await CrudOperations.insert(
        database: _database,
        data: product.toJsonProductCartLocal(),
        tableName: Product.TABLE_CART_NAME);
    return resultCode;
  }

// - - - - - - - - - - - - - - - - - - GET PRODUCTS FROM CART - - - - - - - - - - - - - - - - - -  //
  Future<List<Product>?> getProductsFromCart() async {
    final products = await CrudOperations.getAll(
        database: _database,
        tableName: Product.TABLE_CART_NAME,
        orderByDesc: true);
    if (products == null) return null;
    return products
        .map((product) => Product.fromJsonProductCartLocal(product))
        .toList();
  }

  // - - - - - - - - - - - - - - - - - - GET PRODUCT FROM CART BY ID - - - - - - - - - - - - - - - - - -  //
  Future<Product?> getProductFromCartById({required int id}) async {
    final product = await CrudOperations.get(
        database: _database,
        tableName: Product.TABLE_CART_NAME,
        columnName: Product.COLUMN_ID,
        whereIndex: id);
    if (product == null) return null;
    return Product.fromJsonProductCartLocal(product);
  }

  // - - - - - - - - - - - - - - - - - - UPDATE PRODUCT FROM CART BY ID - - - - - - - - - - - - - - - - - -  //
  Future<int> updateProductFromCartById({required Product product}) async {
    final codeResult = await CrudOperations.update(
        database: _database,
        tableName: Product.TABLE_CART_NAME,
        whereIndex: product.id,
        newData: product.toJsonProductCartLocal(),
        columnWhere: Product.COLUMN_ID);
    return codeResult;
  }

// - - - - - - - - - - - - - - - - - - DELETE PRODUCT FROM CART BY ID - - - - - - - - - - - - - - - - - -  //
  Future<int> deleteProductCartById({required int id}) async {
    final codeResult = await CrudOperations.delete(
        database: _database,
        tableName: Product.TABLE_CART_NAME,
        whereIndex: id,
        columnWhere: Product.COLUMN_ID);
    return codeResult;
  }

// - - - - - - - - - - - - - - - - - - DELETE ALL PRODUCTS FROM CART - - - - - - - - - - - - - - - - - -  //
//   Future<int> deleteProductsFromCart() async {
//     final codeResult = await CrudOperations.deleteAll(
//         database: _database, tableName: Product.);
//     return codeResult;
//   }
}
