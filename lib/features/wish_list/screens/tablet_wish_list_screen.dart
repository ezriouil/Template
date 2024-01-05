import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_empty.dart';
import 'package:test1/common/widgets/custom_grid_view.dart';
import 'package:test1/common/widgets/custom_product_vertical.dart';
import 'package:test1/features/wish_list/wish_list_controller.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/responsive/responsive.dart';

class TabletWishListScreen extends Responsive {
  const TabletWishListScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    // - - - - - - - - - - - - - - - - - - CONTROLLER - - - - - - - - - - - - - - - - - -  //

    final WishListController controller = Get.put(WishListController());
    controller.deviceType = DeviceType.TABLE;
    return Scaffold(
        appBar: AppBar(title: Text("Wish List", style: Theme.of(context)
            .textTheme
            .headlineMedium
            ?.copyWith(fontSize: 40)),
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
                  itemsHeight: 444,
                  itemsInRow: 3,
                  spaceBetweenColumns:
                  CustomSizes.SPACE_BETWEEN_ITEMS,
                  spaceBetweenRows:
                  CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                  count: controller.wishLists.length,
                  controller: controller.scrollController,
                  itemBuilder: (BuildContext context,
                      int index) =>
                      CustomProductVertical(
                        onClick: (int id) {
                          controller
                              .onNavigateToProductScreen(id);
                        },
                        product:
                        controller.wishLists[index],
                        onHeartClick: (_) {},
                      ))),
        ));
  }
}
