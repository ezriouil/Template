class Product {
  // - - - - - - - - - - - - - - - - - - STATES - - - - - - - - - - - - - - - - - -  //

  final int? id, discount, price, oldPrice;
  final bool? inStock;
  final String? title,
      thumbnail1,
      thumbnail2,
      thumbnail3,
      thumbnail4,
      description,
      brand,
      type,
      made,
      color;

  // - - - - - - - - - - - - - - - - - - CONSTRUCTOR- - - - - - - - - - - - - - - - - -  //
  Product(
      {this.id = 0,
      this.title = "",
      this.thumbnail1 = "",
      this.thumbnail2 = "",
      this.thumbnail3 = "",
      this.thumbnail4 = "",
      this.description = "",
      this.inStock = false,
      this.type = "",
      this.discount = 0,
      this.oldPrice = 0,
      this.price = 0,
      this.brand = "",
      this.made = "",
      this.color = ""});

  // - - - - - - - - - - - - - - - - - - TO JSON - - - - - - - - - - - - - - - - - -  //
  Map<String, dynamic> toJson() => {
        'title': title,
        'thumbnail1': thumbnail1,
        'thumbnail2': thumbnail2,
        'thumbnail3': thumbnail3,
        'thumbnail4': thumbnail4,
        'description': description,
        'inStock': inStock,
        'type': type,
        'discount': discount,
        'oldPrice': oldPrice,
        'price': price,
        'brand': brand,
        'made': made,
        'color': color
      };

  // - - - - - - - - - - - - - - - - - - FROM JSON - - - - - - - - - - - - - - - - - -  //
  static Product fromJson(Map json) {
    return Product(
        id: json['id'],
        title: json['title'],
        inStock: json['inStock'],
        thumbnail1: json['thumbnail1'],
        thumbnail2: json['thumbnail1'],
        thumbnail3: json['thumbnail3'],
        thumbnail4: json['thumbnail4'],
        description: json['description'],
        type: json['type'],
        discount: json['discount'],
        oldPrice: json['oldPrice'],
        price: json['price'],
        brand: json['brand'],
        made: json['made'],
        color: json['color']);
  }

  // - - - - - - - - - - - - - - - - - - FROM JSON LOCAL- - - - - - - - - - - - - - - - - -  //
  static Product fromJsonLocal(Map<String, dynamic> json) {
    return Product(
        id: json[COLUMN_ID],
        title: json[COLUMN_TITLE],
        thumbnail1: json[COLUMN_THUMBNAIL],
        discount: int.parse(json[COLUMN_DISCOUNT]),
        oldPrice: int.parse(json[COLUMN_OLD_PRICE]),
        price: int.parse(json[COLUMN_PRICE]),
        brand: json[COLUMN_BRAND]);
  }

  // - - - - - - - - - - - - - - - - - - TO JSON LOCAL - - - - - - - - - - - - - - - - - -  //
  Map<String, dynamic> toJsonLocal() => {
        COLUMN_TITLE: title,
        COLUMN_THUMBNAIL: thumbnail1,
        COLUMN_OLD_PRICE: oldPrice,
        COLUMN_DISCOUNT: discount,
        COLUMN_BRAND: brand,
        COLUMN_PRICE: price,
      };

  // - - - - - - - - - - - - - - - - - - TABLE COLUMNS - - - - - - - - - - - - - - - - - -  //
  static const String COLUMN_ID = "id";
  static const String COLUMN_TITLE = "title";
  static const String COLUMN_THUMBNAIL = "thumbnail";
  static const String COLUMN_BRAND = "brand";
  static const String COLUMN_OLD_PRICE = "oldPrice";
  static const String COLUMN_DISCOUNT = "discount";
  static const String COLUMN_PRICE = "price";

  static const String TABLE_NAME = "WishList";

  static const String CREATE_TABLE = "CREATE TABLE $TABLE_NAME ( "
      "$COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT,"
      "$COLUMN_TITLE TEXT ,"
      "$COLUMN_THUMBNAIL TEXT ,"
      "$COLUMN_DISCOUNT TEXT ,"
      "$COLUMN_BRAND TEXT ,"
      "$COLUMN_OLD_PRICE TEXT ,"
      "$COLUMN_PRICE TEXT )";
}
