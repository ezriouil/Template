import 'dart:convert';

import 'package:test1/data/models/coupon.dart';
import 'package:test1/utils/constants/custom_api.dart';
import 'package:test1/utils/http/http_client.dart';

class CouponRepository {
  CouponRepository._();

 static final int CODE_ERROR = Http.CODE_ERROR;


  // - - - - - - - - - - - - - - - - - - GET COUPONS - - - - - - - - - - - - - - - - - -  //
  static Future<List<Coupon>?> getCoupons() async {
    final response = await Http.get(CustomApi.ACTION_GET_COUPONS);
    if (response == null) return null;
    if (response == Http.CODE_ERROR) return List.empty();
    return (json.decode(response) as List)
        .map((coupon) => Coupon.fromJson(coupon))
        .toList();
  }
}
