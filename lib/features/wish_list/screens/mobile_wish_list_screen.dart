import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_empty.dart';
import 'package:test1/common/widgets/custom_grid_view.dart';
import 'package:test1/common/widgets/custom_product_vertical.dart';
import 'package:test1/features/wish_list/wish_list_controller.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/responsive/responsive.dart';

class MobileWishListScreen extends Responsive {
  const MobileWishListScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    // - - - - - - - - - - - - - - - - - - CONTROLLER - - - - - - - - - - - - - - - - - -  //

    final WishListController controller = Get.put(WishListController());
    return Scaffold(
        appBar: AppBar(title: const Text("Wish List"),
          automaticallyImplyLeading: false,
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(4.0),

          // - - - - - - - - - - - - - - - - - - OBSERVER - - - - - - - - - - - - - - - - - -  //

          child: Obx(() =>

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
                      : controller.wishLists.isEmpty

                          // - - - - - - - - - - - - - - - - - - LIST EMPTY - - - - - - - - - - - - - - - - - -  //

                          ? SizedBox(
                              height: getHeight(context),
                              width: getWidth(context),
                              child: const CustomEmpty(text: "No Wish Lists !"),
                            )

                          // - - - - - - - - - - - - - - - - - - SHOW DATA - - - - - - - - - - - - - - - - - -  //

                          : CustomGridView(
                              count: controller.wishLists.length,
                              controller: controller.scrollController,
                              itemBuilder: (BuildContext context, int index) =>
                                  CustomProductVertical(
                                      onClick: (int id) {
                                        controller.onNavigateToProductScreen(
                                            id, DeviceType.MOBILE);
                                      },
                                      onHeartClick:
                                          controller.onDeleteWishListById,
                                      product: controller.wishLists[index]))),
        ),
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
