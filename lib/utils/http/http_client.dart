import 'package:test1/utils/constants/custom_api.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  HttpClient._();

  /// GET
  static Future<dynamic> get(String endPoint) async {
    try {
      Uri uri = Uri.parse(CustomApi.BASE_URL + endPoint);
      final response = await http.get(uri, headers: {"Content-Type" : "application/json ; charset=UTF-8"});
      return _handelResponse(response);
    }catch(e){
      return null;
    }
  }

  /// POST
  static Future<dynamic> post(String endPoint, dynamic body) async {
    try {
      Uri uri = Uri.parse(CustomApi.BASE_URL + endPoint);
      final response = await http.post(uri, headers: {"Content-Type" : "application/json ; charset=UTF-8"}, body: body);
      return _handelResponse(response);
    }catch(e){
      return null;
    }
  }

  /// DELETE
  static Future<dynamic> delete(String endPoint) async {
    try {
      Uri uri = Uri.parse(CustomApi.BASE_URL + endPoint);
      final response = await http.delete(uri ,headers: {"Content-Type" : "application/json ; charset=UTF-8"},);
      return _handelResponse(response);
    }catch(e){
      return null;
    }
  }


  /// RESPONSE HANDLER
  static dynamic _handelResponse(http.Response response) {
    if (response.statusCode == 200) {
      return response.body;
    }else{
      return null;
    }
  }
}
