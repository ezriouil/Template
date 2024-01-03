import 'dart:convert';

import 'package:test1/data/models/local_notification.dart';
import 'package:test1/utils/constants/custom_api.dart';
import 'package:test1/utils/http/http_client.dart';

class NotificationRepository {
  NotificationRepository._();

 static final int CODE_ERROR = Http.CODE_ERROR;


  // - - - - - - - - - - - - - - - - - - GET NOTIFICATIONS - - - - - - - - - - - - - - - - - -  //
  static Future<List<LocalNotification>?> getNotifications() async {
    final response = await Http.get(CustomApi.ACTION_GET_NOTIFICATIONS);
    if (response == null) return null;
    if (response == Http.CODE_ERROR) return List.empty();
    return (json.decode(response) as List)
        .map((notification) => LocalNotification.fromJson(notification))
        .toList();
  }

  // - - - - - - - - - - - - - - - - - - DELETE NOTIFICATION - - - - - - - - - - - - - - - - - -  //
  static Future<int> deleteNotificationById({required int id}) async {
    final response = await Http.get(CustomApi.ACTION_DELETE_NOTIFICATION_BY_ID + id.toString());
    if (response == 0) return CODE_ERROR;
    if (response == CODE_ERROR) return CODE_ERROR;
    return response;
  }
}
