import 'package:test1/data/models/location_address.dart';

class Order {
  // - - - - - - - - - - - - - - - - - - STATES - - - - - - - - - - - - - - - - - -  //

  final int id, orderPrice;
  final String? order, date, orderState;
  final LocationAddress? locationAddress;

  // - - - - - - - - - - - - - - - - - - CONSTRUCTOR- - - - - - - - - - - - - - - - - -  //
  Order(
      {this.id = 0,
      this.orderPrice = 0,
      this.order = "",
      this.date = "",
      this.orderState = "",
      this.locationAddress});

  // - - - - - - - - - - - - - - - - - - TO JSON - - - - - - - - - - - - - - - - - -  //
  Map<String, dynamic> toJson() => {
        'id': id,
        'orderPrice': orderPrice,
        'order': order,
        'date': date,
        'orderState': orderState,
        'locationAddress': locationAddress,
      };

  // - - - - - - - - - - - - - - - - - - FROM JSON- - - - - - - - - - - - - - - - - -  //
  static Order fromJson(Map json) {
    return Order(
        id: json['id'],
        orderPrice: json['orderPrice'],
        order: json['order'],
        date: json['date'],
        orderState: json['orderState'],
        locationAddress: json['locationAddress']);
  }
}
