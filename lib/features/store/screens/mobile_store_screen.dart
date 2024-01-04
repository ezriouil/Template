import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_empty.dart';
import 'package:test1/common/widgets/custom_product_vertical.dart';
import 'package:test1/common/widgets/custom_shimmer_effect.dart';
import 'package:test1/common/widgets/custom_text_field.dart';
import 'package:test1/data/models/product.dart';
import 'package:test1/features/store/store_controller.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/extensions/validator.dart';
import 'package:test1/utils/responsive/responsive.dart';

import '../../../common/widgets/custom_grid_view.dart';

class MobileStoreScreen extends Responsive {
  const MobileStoreScreen({
    super.key,
  });

  @override
  Widget execute(BuildContext context) {
    final StoreController controller = Get.put(StoreController());
    return Scaffold(
        body: NestedScrollView(
            controller: controller.scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                // - - - - - - - - - - - - - - - - - - APP BAR - - - - - - - - - - - - - - - - - -  //
                SliverAppBar(
                  title: Text("Store",
                      style: Theme.of(context).textTheme.headlineMedium),
                  automaticallyImplyLeading: false,
                  actions: [
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: CustomSizes.SPACE_BETWEEN_ITEMS),
                        child: InkWell(
                            onTap: () {},
                            child: Icon(Iconsax.notification,
                                color: darkLightColor(context))),
                      ),
                      Positioned(
                        right: CustomSizes.SPACE_BETWEEN_ITEMS,
                        child: Badge(backgroundColor: primaryColor(context)),
                      )
                    ]),
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: CustomSizes.SPACE_BETWEEN_ITEMS),
                        child: InkWell(
                            onTap: () {},
                            child: Icon(Iconsax.receipt_discount,
                                color: darkLightColor(context))),
                      ),
                      Positioned(
                        right: CustomSizes.SPACE_BETWEEN_ITEMS/1.5,
                        child: Badge(backgroundColor: primaryColor(context)),
                      )
                    ]),
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: CustomSizes.SPACE_BETWEEN_ITEMS),
                        child: InkWell(
                            onTap: () {},
                            child: Icon(Iconsax.bag_24,
                                color: darkLightColor(context))),
                      ),
                      Positioned(
                        right: CustomSizes.SPACE_BETWEEN_ITEMS,
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
                              child: CustomTextField(
                                  hint: "Search in store",
                                  validator: (value) =>
                                      Validator.validateEmptyField(
                                          "Search in store", value),
                                  width: getWidth(context),
                                  leadingIcon: Iconsax.search_normal,
                                  controller: TextEditingController(),
                                  withDefaultPadding: false)),
                          Expanded(
                              child: InkWell(
                                  onTap: controller.showFilterBottomSheet,
                                  child:
                                      const Icon(Icons.filter_list, size: 30)))
                        ],
                      ),
                    ),
                    const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                    // - - - - - - - - - - - - - - - - - - LOADING STATE TRUE - - - - - - - - - - - - - - - - - -  //
                    controller.isLoading.isTrue
                        ? CustomShimmerEffect(
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
                                        text: "No Notifications !"),
                                  )

                                // - - - - - - - - - - - - - - - - - - SHOW DATA - - - - - - - - - - - - - - - - - -  //
                                : CustomGridView(
                                    spaceBetweenColumns:
                                        CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                                    spaceBetweenRows:
                                        CustomSizes.SPACE_BETWEEN_ITEMS / 4,
                                    count: controller.productsLists.length,
                                    controller: controller.scrollController,
                                    itemBuilder: (BuildContext context,
                                            int index) =>
                                        CustomProductVertical(
                                          onClick: (int id) {
                                            controller
                                                .onNavigateToProductScreen(
                                                    deviceType:
                                                        DeviceType.MOBILE,
                                                    id: id);
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
