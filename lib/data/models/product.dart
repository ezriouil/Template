class Product {
  // - - - - - - - - - - - - - - - - - - STATES - - - - - - - - - - - - - - - - - -  //

  final int? oldPrice, discount;
  final bool? inStock,
      sizeSmall,
      sizeMedium,
      sizeLarge,
      sizeXLarge,
      sizeXXLarge,
      sizeXXXLarge,
      sizeXXXXLarge;
  final String? title,
      thumbnail1,
      description,
      brand,
      type,
      thumbnail2,
      thumbnail3,
      thumbnail4,
      made,
      categoryId,
      color;
  final int? id, price;

  // - - - - - - - - - - - - - - - - - - CONSTRUCTOR- - - - - - - - - - - - - - - - - -  //
  Product({
    this.id,
    this.title,
    this.inStock,
    this.thumbnail1,
    this.description,
    this.type,
    this.price,
    this.brand,
    this.sizeSmall,
    this.sizeMedium,
    this.sizeLarge,
    this.thumbnail2 = "",
    this.thumbnail3 = "",
    this.thumbnail4 = "",
    this.oldPrice = 0,
    this.discount = 0,
    this.categoryId = "",
    this.made = "",
    this.color = "",
    this.sizeXLarge = false,
    this.sizeXXLarge = false,
    this.sizeXXXLarge = false,
    this.sizeXXXXLarge = false,
  });

  // - - - - - - - - - - - - - - - - - - PRODUCT SIZE - - - - - - - - - - - - - - - - - -  //
  String size(){
    if(sizeSmall??false) return "S";
    if(sizeMedium?? false) return "M";
    if(sizeLarge?? false) return "L";
    if(sizeXLarge?? false) return "XL";
    if(sizeXXLarge?? false) return "2XL";
    if(sizeXXXLarge?? false) return "3XL";
    if(sizeXXXXLarge?? false) return "4XL";
    return "";
  }

  // - - - - - - - - - - - - - - - - - - LIST OF PRODUCTS SIZES AVAILABLE - - - - - - - - - - - - - - - - - -  //
  List<String> productSizesAvailable(){
    final List<String> listSizes = [];
    sizeSmall! ? listSizes.add("S") : null;
    sizeMedium! ? listSizes.add("M") : null;
    sizeLarge! ? listSizes.add("L") : null;
    sizeXLarge! ? listSizes.add("XL") : null;
    sizeXXLarge! ? listSizes.add("2XL") : null;
    sizeXXXLarge! ? listSizes.add("3XL") : null;
    sizeXXXXLarge! ? listSizes.add("4XL") : null;
    return listSizes;
  }

  // - - - - - - - - - - - - - - - - - - TO JSON - - - - - - - - - - - - - - - - - -  //
  Map<String, dynamic> toJson() => {
        'id': id,
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
        'categoryId': categoryId,
        'made': made,
        'color': color,
        'sizeSmall': sizeSmall,
        'sizeMedium': sizeMedium,
        'sizeLarge': sizeLarge,
        'sizeXLarge': sizeXLarge,
        'sizeXXLarge': sizeXXLarge,
        'sizeXXXLarge': sizeXXXLarge,
        'sizeXXXXLarge': sizeXXXXLarge,
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
      categoryId: json['categoryId'],
      made: json['made'],
      color: json['color'],
      sizeSmall: json['sizeSmall'],
      sizeMedium: json['sizeMedium'],
      sizeLarge: json['sizeLarge'],
      sizeXLarge: json['sizeXLarge'],
      sizeXXLarge: json['sizeXXLarge'],
      sizeXXXLarge: json['sizeXXXLarge'],
      sizeXXXXLarge: json['sizeXXXXLarge'],
    );
  }


  // - - - - - - - - - - - - - - - - - - TABLE COLUMNS - - - - - - - - - - - - - - - - - -  //
  static const String COLUMN_ID = "id";
  static const String COLUMN_TITLE = "title";
  static const String COLUMN_THUMBNAIL = "thumbnail";
  static const String COLUMN_BRAND = "brand";
  static const String COLUMN_OLD_PRICE = "oldPrice";
  static const String COLUMN_DISCOUNT = "discount";
  static const String COLUMN_PRICE = "price";
  static const String COLUMN_COUNT = "count";

  // *- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - * //
  // *- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - * //

  // - - - - - - - - - - - - - - - - - - TABLE WISHLIST - - - - - - - - - - - - - - - - - -  //
  static const String TABLE_WISHLIST_NAME = "WishList";
  static const String CREATE_WISHLIST_TABLE = "CREATE TABLE $TABLE_WISHLIST_NAME ( "
      "$COLUMN_ID INTEGER PRIMARY KEY ,"
      "$COLUMN_TITLE TEXT ,"
      "$COLUMN_THUMBNAIL TEXT ,"
      "$COLUMN_DISCOUNT INTEGER ,"
      "$COLUMN_BRAND TEXT ,"
      "$COLUMN_OLD_PRICE INTEGER ,"
      "$COLUMN_PRICE INTEGER )";

  // - - - - - - - - - - - - - - - - - - *FROM* JSON PRODUCT WISHLIST LOCAL - - - - - - - - - - - - - - - - - -  //
  static Product fromJsonProductWishListLocal(Map<String, dynamic> json) {
    return Product(
        id:json[COLUMN_ID],
        title: json[COLUMN_TITLE],
        thumbnail1: json[COLUMN_THUMBNAIL],
        discount: json[COLUMN_DISCOUNT],
        oldPrice: json[COLUMN_OLD_PRICE],
        price: json[COLUMN_PRICE],
        brand: json[COLUMN_BRAND]);
  }

  // - - - - - - - - - - - - - - - - - - *TO* JSON PRODUCT WISHLIST LOCAL - - - - - - - - - - - - - - - - - -  //
  Map<String, dynamic> toJsonProductWishListLocal() => {
    COLUMN_ID: id,
    COLUMN_TITLE: title,
    COLUMN_THUMBNAIL: thumbnail1,
    COLUMN_OLD_PRICE: oldPrice,
    COLUMN_DISCOUNT: discount,
    COLUMN_BRAND: brand,
    COLUMN_PRICE: price,
  };

  // *- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - * //
  // *- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - * //

  // - - - - - - - - - - - - - - - - - - TABLE CART - - - - - - - - - - - - - - - - - -  //
  static const String TABLE_CART_NAME = "Cart";
  static const String CREATE_CART_TABLE = "CREATE TABLE $TABLE_CART_NAME ( "
      "$COLUMN_ID INTEGER PRIMARY KEY ,"
      "$COLUMN_TITLE TEXT ,"
      "$COLUMN_THUMBNAIL TEXT ,"
      "$COLUMN_COUNT INTEGER ,"
      "$COLUMN_BRAND TEXT ,"
      "$COLUMN_PRICE INTEGER )";

  // - - - - - - - - - - - - - - - - - - *FROM* JSON PRODUCT CART LOCAL - - - - - - - - - - - - - - - - - -  //
  static Product fromJsonProductCartLocal(Map<String, dynamic> json) {
    return Product(
        id: json[COLUMN_ID],
        title: json[COLUMN_TITLE],
        thumbnail1: json[COLUMN_THUMBNAIL],
        discount: json[COLUMN_COUNT], // COUNT FIELD I JUST REPLACED BY DISCOUNT
        price: json[COLUMN_PRICE],
        brand: json[COLUMN_BRAND]);
  }

  // - - - - - - - - - - - - - - - - - - *TO* JSON PRODUCT CART LOCAL - - - - - - - - - - - - - - - - - -  //
  Map<String, dynamic> toJsonProductCartLocal() => {
    COLUMN_ID: id,
    COLUMN_TITLE: title,
    COLUMN_COUNT: discount, // COUNT FIELD I JUST REPLACED BY DISCOUNT
    COLUMN_THUMBNAIL: thumbnail1,
    COLUMN_BRAND: brand,
    COLUMN_PRICE: price,
  };

  // *- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - * //
  // *- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - * //

  // - - - - - - - - - - - - - - - - - - CHECKOUT CART - - - - - - - - - - - - - - - - - -  //
  static const String TABLE_CHECKOUT_NAME = "Checkout";
  static const String CREATE_CHECKOUT_TABLE = "CREATE TABLE $TABLE_CHECKOUT_NAME ( "
      "$COLUMN_ID INTEGER PRIMARY KEY ,"
      "$COLUMN_TITLE TEXT ,"
      "$COLUMN_THUMBNAIL TEXT ,"
      "$COLUMN_BRAND TEXT )";

  // - - - - - - - - - - - - - - - - - - *FROM* JSON PRODUCT CHECKOUT LOCAL - - - - - - - - - - - - - - - - - -  //
  static Product fromJsonProductCheckoutLocal(Map<String, dynamic> json) {
    return Product(
        id: json[COLUMN_ID],
        title: json[COLUMN_TITLE],
        thumbnail1: json[COLUMN_THUMBNAIL],
        brand: json[COLUMN_BRAND]);
  }

  // - - - - - - - - - - - - - - - - - - *TO* JSON PRODUCT CHECKOUT LOCAL - - - - - - - - - - - - - - - - - -  //
  Map<String, dynamic> toJsonProductCheckoutLocal() => {
    COLUMN_ID: id,
    COLUMN_TITLE: title,
    COLUMN_THUMBNAIL: thumbnail1,
    COLUMN_PRICE: price,
  };
}
