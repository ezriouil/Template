class CustomApi {
  CustomApi._();

  // - - - - - - - - - - - - - - - - - - BASE URL + API KEY - - - - - - - - - - - - - - - - - -  //
  static String BASE_URL = "https://script.google.com";
  static const String API_KEY =
      "/macros/s/AKfycbyeVXsTvns7fijr_L0IALBTyhtZ4a6Fd_jTW6xd3IQP36x1y0a4KnnKZZ_ht7_sVahEWg/exec";

  // - - - - - - - - - - - - - - - - - - PRODUCT ACTIONS - - - - - - - - - - - - - - - - - -  //
  static const ACTION_GET_PRODUCTS = "?action=getProducts";
  static const ACTION_GET_PRODUCT_BY_ID = "?action=getProductById&id=";

  // - - - - - - - - - - - - - - - - - - NOTIFICATION ACTIONS - - - - - - - - - - - - - - - - - -  //
  static const ACTION_GET_NOTIFICATIONS = "?action=getNotifications";
  static const ACTION_DELETE_NOTIFICATION_BY_ID = "?action=deleteNotificationById&id=";

  // - - - - - - - - - - - - - - - - - - ORDER ACTIONS - - - - - - - - - - - - - - - - - -  //
  static const ACTION_GET_ORDERS = "?action=getOrders";

}