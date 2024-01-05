class CustomApi {
  CustomApi._();

  // - - - - - - - - - - - - - - - - - - BASE URL + API KEY - - - - - - - - - - - - - - - - - -  //
  static String BASE_URL = "https://script.google.com";
  static const String API_KEY =
      "/macros/s/AKfycbzOAd63wYJ6Oe7zf4H3XO2WDm75DJqRt5OHAm28FBYywsSkD3uRFIVsoe8OsKFh5DVo7w/exec";

  // - - - - - - - - - - - - - - - - - - PRODUCT ACTIONS - - - - - - - - - - - - - - - - - -  //
  static const ACTION_GET_PRODUCTS = "?action=getProducts";
  static const ACTION_GET_PRODUCT_BY_ID = "?action=getProductById&id=";

  // - - - - - - - - - - - - - - - - - - NOTIFICATION ACTIONS - - - - - - - - - - - - - - - - - -  //
  static const ACTION_GET_NOTIFICATIONS = "?action=getNotifications";

  // - - - - - - - - - - - - - - - - - - NOTIFICATION ACTIONS - - - - - - - - - - - - - - - - - -  //
  static const ACTION_GET_COUPONS = "?action=getCoupons";
  static const ACTION_DELETE_NOTIFICATION_BY_ID = "?action=deleteNotificationById&id=";

  // - - - - - - - - - - - - - - - - - - ORDER ACTIONS - - - - - - - - - - - - - - - - - -  //
  static const ACTION_GET_ORDERS = "?action=getOrders";

}