import 'dart:convert';
import 'package:test1/data/models/order.dart';
import 'package:test1/utils/constants/custom_api.dart';
import 'package:test1/utils/http/http_client.dart';

class OrderRepository {
  OrderRepository._();

  static final int CODE_ERROR = Http.CODE_ERROR;

  // - - - - - - - - - - - - - - - - - - GET ORDERS - - - - - - - - - - - - - - - - - -  //
  static Future<List<Order>?> getOrders() async {
    final response = await Http.get(CustomApi.ACTION_GET_ORDERS);
    if (response == null) return null;
    if (response == Http.CODE_ERROR) return List.empty();
    return (json.decode(response) as List)
        .map((order) => Order.fromJson(order))
        .toList();
  }
}
