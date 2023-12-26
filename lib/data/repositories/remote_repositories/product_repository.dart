import 'package:test1/data/models/product.dart';
import 'package:test1/utils/http/http_client.dart';

class ProductRepository {
  ProductRepository._();

  static final Product CODE_ERROR = Product();

  // - - - - - - - - - - - - - - - - - - GET PRODUCT BY ID - - - - - - - - - - - - - - - - - -  //
  static Future<Product?> getProductById({required int productId}) async {
    // final response = await Http.get(CustomApi.ACTION_GET_PRODUCT_BY_ID);
    // if (response == null) return null;
    // if (response == Http.CODE_ERROR) return List.empty();
    // return (json.decode(response) as List)
    //     .map((notification) => LocalNotification.fromJson(notification))
    //     .toList();
    return null;
  }
}
