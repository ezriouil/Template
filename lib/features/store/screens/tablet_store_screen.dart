import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_empty.dart';
import 'package:test1/common/widgets/custom_product_vertical.dart';
import 'package:test1/common/widgets/custom_shimmer_effect.dart';
import 'package:test1/data/models/product.dart';
import 'package:test1/features/store/store_controller.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/responsive/responsive.dart';

import '../../../common/widgets/custom_grid_view.dart';

class TabletStoreScreen extends Responsive {
  const TabletStoreScreen({
    super.key,
  });

  @override
  Widget execute(BuildContext context) {
    final StoreController controller = Get.put(StoreController());
    controller.deviceType = DeviceType.TABLE;
    return Scaffold(
        body: NestedScrollView(
            controller: controller.scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                // - - - - - - - - - - - - - - - - - - APP BAR - - - - - - - - - - - - - - - - - -  //
                SliverAppBar(
                  title: Text("Store",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontSize: 40)),
                  automaticallyImplyLeading: false,
                  actions: [
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: CustomSizes.SPACE_DEFAULT),
                        child: InkWell(
                            onTap: controller.onNavigateToNotificationsScreen,
                            child: Icon(Iconsax.notification,
                                size: 30, color: darkLightColor(context))),
                      ),
                      Positioned(
                        right: CustomSizes.SPACE_DEFAULT,
                        child: Badge(backgroundColor: primaryColor(context)),
                      )
                    ]),
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: CustomSizes.SPACE_DEFAULT),
                        child: InkWell(
                            onTap: controller.onNavigateToCouponsScreen,
                            child: Icon(Iconsax.receipt_discount,
                                size: 30, color: darkLightColor(context))),
                      ),
                      Positioned(
                        right: CustomSizes.SPACE_DEFAULT / 1.5,
                        child: Badge(backgroundColor: primaryColor(context)),
                      )
                    ]),
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: CustomSizes.SPACE_DEFAULT),
                        child: InkWell(
                            onTap:controller.onNavigateToCartScreen,
                            child: Icon(Iconsax.bag_24,
                                size: 30, color: darkLightColor(context))),
                      ),
                      Positioned(
                        right: CustomSizes.SPACE_DEFAULT,
                        child: Badge(backgroundColor: primaryColor(context)),
                      )
                    ]),
                  ],
                  centerTitle: false,
                )
              ];
            },

            // - - - - - - - - - - - - - - - - - - BODY - - - - - - - - - - - - - - - - - -  //
            body: SingleChildScrollView(
              child: Obx(
                () => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 6,
                              child: TextField(
                                  onChanged: controller.filter,
                                  decoration: InputDecoration(
                                      hintText: "Search in store",
                                      prefix: Icon(
                                        Iconsax.search_normal,
                                        color: grayColor(context),
                                      )))),
                          Expanded(
                              child: InkWell(
                                  onTap: controller.showFilterBottomSheet,
                                  child:
                                      const Icon(Icons.filter_list, size: 40)))
                        ],
                      ),
                    ),
                    const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                    // - - - - - - - - - - - - - - - - - - LOADING STATE TRUE - - - - - - - - - - - - - - - - - -  //
                    controller.isLoading.isTrue
                        ? CustomShimmerEffect(
                            itemsHeight: 444,
                            child: CustomProductVertical(
                                product: Product(),
                                onClick: (_) {},
                                onHeartClick: (_) {}))

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
                            : controller.productsLists.isEmpty

                                // - - - - - - - - - - - - - - - - - - LIST EMPTY - - - - - - - - - - - - - - - - - -  //
                                ? SizedBox(
                                    height: getHeight(context),
                                    width: getWidth(context),
                                    child: const CustomEmpty(
                                        text: "No Products !"),
                                  )

                                // - - - - - - - - - - - - - - - - - - SHOW DATA - - - - - - - - - - - - - - - - - -  //
                                : CustomGridView(
                                    itemsHeight: 444,
                                    itemsInRow: 3,
                                    spaceBetweenColumns:
                                        CustomSizes.SPACE_BETWEEN_ITEMS,
                                    spaceBetweenRows:
                                        CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                                    count: controller.productsLists.length,
                                    controller: controller.scrollController,
                                    itemBuilder: (BuildContext context,
                                            int index) =>
                                        CustomProductVertical(
                                          onClick: (int id) {
                                            controller
                                                .onNavigateToProductScreen(id: id);
                                          },
                                          product:
                                              controller.productsLists[index],
                                          onHeartClick: (Product product) {},
                                        ))
                  ],
                ),
              ),
            )));
  }
}
