import 'package:get/get.dart';
import 'package:test1/common/widgets/custom_animation_screen.dart';
import 'package:test1/common/widgets/custom_snackbars.dart';
import 'package:test1/data/models/local_notification.dart';
import 'package:test1/data/repositories/remote_repositories/notification_repository.dart';

class NotificationController extends GetxController {
// - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //

  late final RxList<LocalNotification> notifications;
  late RxBool isLoading;
  late Rx<String?> errorMsg;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //

  @override
  void onInit() {
    super.onInit();
    isLoading = true.obs;
    errorMsg = null.obs;
    notifications = RxList.empty();
    init();
  }

  init() async {
    await _onGetNotifications();
  }

  // - - - - - - - - - - - - - - - - - - GET NOTIFICATION FROM REMOTE DATABASE - - - - - - - - - - - - - - - - - -  //
  Future<void> _onGetNotifications() async {
    try {
      /// GET NOTIFICATIONS
      final getNotifications = await NotificationRepository.getNotifications();

      if (getNotifications == null) {
        /// SHOW THE ERROR SNACK BAR
        isLoading.value = false;
        errorMsg.value = "Try again..";
        return;
      }

      if (getNotifications.isEmpty) {
        notifications.value = [];

        /// SHOW THE ERROR SNACK BAR
        isLoading.value = false;
        return;
      }
      notifications.addAll(getNotifications);

      /// STOP THE LOADER
      isLoading.value = false;
    } catch (_) {
      /// STOP THE LOADER
      isLoading.value = false;
      errorMsg.value = "Try again..";
    }
  }

  // - - - - - - - - - - - - - - - - - - DELETE NOTIFICATION BY ID - - - - - - - - - - - - - - - - - -  //
  Future<void> onDeleteNotificationById(LocalNotification notification) async {
    try {
      NotificationRepository.deleteNotificationById(id: notification.id!);

      /// START LOADER
      Get.to(const CustomAnimationScreen(text: "We are saving your info ..."));

      /// DELETE NOTIFICATION BY ID
      final resultCode = await NotificationRepository.deleteNotificationById(
          id: notification.id!);

      if (resultCode == NotificationRepository.CODE_ERROR) {
        await Future.delayed(const Duration(milliseconds: 500));
        Get.back();
        await Future.delayed(const Duration(milliseconds: 500));

        /// SHOW THE ERROR SNACK BAR
        CustomSnackBars.error(
            title: "We can't delete this notification", message: "Try again.");
        return;
      }
      notifications.remove(notification);

      /// STOP THE LOADER
      Get.back();
      await Future.delayed(const Duration(milliseconds: 500));

      /// FINISHED
      CustomSnackBars.success(
          title: "Done", message: "Your notification deleted successfully!");
    } catch (_) {
      /// STOP THE LOADER
      await Future.delayed(const Duration(milliseconds: 500));
      Get.back();
      await Future.delayed(const Duration(milliseconds: 500));

      /// SHOW THE ERROR SNACK BAR
      CustomSnackBars.error(
          title: "Error 404", message: "please try again next time!");
    }
  }
  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    notifications.close();
    isLoading.close();
    errorMsg.close();
  }
}
