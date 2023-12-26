import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_empty.dart';
import 'package:test1/features/notification/notification_controller.dart';
import 'package:test1/features/notification/widgets/custom_notification.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/responsive/responsive.dart';

class MobileNotificationScreen extends Responsive {
  const MobileNotificationScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    // - - - - - - - - - - - - - - - - - - CONTROLLER - - - - - - - - - - - - - - - - - -  //

    final NotificationController controller = Get.put(NotificationController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
          leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(
              Iconsax.arrow_left_24,
              color: darkLightColor(context),
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(4.0),

            // - - - - - - - - - - - - - - - - - - OBSERVER - - - - - - - - - - - - - - - - - -  //

            child: Obx(
              () =>

                  // - - - - - - - - - - - - - - - - - - LOADING STATE TRUE - - - - - - - - - - - - - - - - - -  //

                  controller.isLoading.isTrue
                      ? Center(
                          child: CircularProgressIndicator(
                              color: primaryColor(context)))

                      // - - - - - - - - - - - - - - - - - - LOADING STATE FALSE - - - - - - - - - - - - - - - - - -  //

                      : controller.errorMsg.value != null

                          // - - - - - - - - - - - - - - - - - - HAS ERROR - - - - - - - - - - - - - - - - - -  //

                          ? SizedBox(
                              height: getHeight(context),
                              width: getWidth(context),
                              child: const CustomEmpty(
                                text: "Error 404 !",
                                icon: Iconsax.message_remove,
                              ))
                          : controller.notifications.isEmpty

                              // - - - - - - - - - - - - - - - - - - LIST EMPTY - - - - - - - - - - - - - - - - - -  //

                              ? SizedBox(
                                  height: getHeight(context),
                                  width: getWidth(context),
                                  child: const CustomEmpty(
                                      text: "No Notifications !"),
                                )

                              // - - - - - - - - - - - - - - - - - - SHOW DATA - - - - - - - - - - - - - - - - - -  //
                              : ListView.builder(controller: controller.scrollController,
                                  itemCount: controller.notifications.length,
                                  itemBuilder: (BuildContext context,
                                          int index) =>
                                      CustomNotification(
                                          notification:
                                              controller.notifications[index],
                                          onClick: controller
                                              .onDeleteNotificationById)),
            )),
      floatingActionButton: Obx(
            () => AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: controller.showFloatingActionButton.value ? 1.0 : 0.0,
          child: FloatingActionButton(
            onPressed: () {
              controller.scrollController.animateTo(0,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.fastOutSlowIn);
            },
            elevation: 16.0,
            backgroundColor: primaryColor(context),
            child: const Icon(Iconsax.arrow_up_24, color: CustomColors.WHITE),
          ),
        ),
      ),
    );
  }
}
