class Coupon {
  // - - - - - - - - - - - - - - - - - - STATES - - - - - - - - - - - - - - - - - -  //
  final int? id,discount;
  final String? code,availableUntil;

  // - - - - - - - - - - - - - - - - - - CONSTRUCTOR - - - - - - - - - - - - - - - - - -  //
  Coupon(
      {this.id = 0,
      required this.discount,
      required this.code,
      required this.availableUntil,});

  // - - - - - - - - - - - - - - - - - - FROM JSON - - - - - - - - - - - - - - - - - -  //
  static Coupon fromJson(Map<String, dynamic> json) {
    return Coupon(
        id: json["id"] as int,
        discount: json["discount"]as int,
        code: json["code"]as String,
        availableUntil: json["availableUntil"] as String);
  }

  // - - - - - - - - - - - - - - - - - - TO JSON - - - - - - - - - - - - - - - - - -  //
  Map<String, dynamic> toJson() => {
        "id": id,
        "discount": discount,
        "code": code,
        "availableUntil": availableUntil,
      };
}
