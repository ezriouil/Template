class CustomApi {
  CustomApi._();

  // - - - - - - - - - - - - - - - - - - BASE URL + API KEY - - - - - - - - - - - - - - - - - -  //
  static String BASE_URL = "https://script.google.com";
  static const String API_KEY =
      "/macros/s/AKfycbxvQV71ahgptocES_tQ7yDeaUgHBWbuC5LT8Q4azvJH-b3JMZ-b3V4zkwxGLjMBwshtOA/exec";

  // - - - - - - - - - - - - - - - - - - PRODUCT ACTIONS - - - - - - - - - - - - - - - - - -  //
  static const ACTION_GET_PRODUCTS = "?action=getFoods";
  static const ACTION_GET_PRODUCT_BY_ID = "?action=getProductById&id=";

  // - - - - - - - - - - - - - - - - - - NOTIFICATION ACTIONS - - - - - - - - - - - - - - - - - -  //
  static const ACTION_GET_NOTIFICATIONS = "?action=getNotifications";
  static const ACTION_DELETE_NOTIFICATION_BY_ID = "?action=deleteNotificationById&id=";
}
