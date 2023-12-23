import 'package:test1/utils/constants/custom_api.dart';
import 'package:http/http.dart' as http;

class Http {
  Http._();

  static int CODE_ERROR = 404;

  /// GET
  static Future<dynamic> get(String endPoint) async {
    try {
      Uri uri = Uri.parse(CustomApi.BASE_URL + CustomApi.API_KEY + endPoint);
      final response = await http.get(uri,
          headers: {"Content-Type": "application/json ; charset=UTF-8"});
      return _handelResponse(response);
    } catch (e) {
      return CODE_ERROR;
    }
  }

  /// POST
  static Future<dynamic> post(String endPoint, dynamic body) async {
    try {
      Uri uri = Uri.parse(CustomApi.BASE_URL + endPoint);
      final response = await http.post(uri,
          headers: {"Content-Type": "application/json ; charset=UTF-8"},
          body: body);
      return _handelResponse(response);
    } catch (e) {
      return CODE_ERROR;
    }
  }

  /// DELETE
  static Future<dynamic> delete(String endPoint) async {
    try {
      Uri uri = Uri.parse(CustomApi.BASE_URL + endPoint);
      final response = await http.delete(
        uri,
        headers: {"Content-Type": "application/json ; charset=UTF-8"},
      );
      return _handelResponse(response);
    } catch (e) {
      return CODE_ERROR;
    }
  }

  /// RESPONSE HANDLER
  static dynamic _handelResponse(http.Response response) {
    if (response.statusCode == 200) return response.body;
    return null;
  }
}
