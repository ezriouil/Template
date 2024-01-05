import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:test1/common/footer/conditions.dart';
import 'package:test1/common/footer/contact_us.dart';
import 'package:test1/common/widgets/custom_brand.dart';
import 'package:test1/common/widgets/custom_counter.dart';
import 'package:test1/common/widgets/custom_elevated_button.dart';
import 'package:test1/common/widgets/custom_empty.dart';
import 'package:test1/common/widgets/custom_icon_button.dart';
import 'package:test1/common/widgets/custom_image_network.dart';
import 'package:test1/common/widgets/custom_prices.dart';
import 'package:test1/common/widgets/custom_text_box.dart';
import 'package:test1/features/product/product_controller.dart';
import 'package:test1/features/product/widgets/custom_carousel_product_images.dart';
import 'package:test1/features/product/widgets/custom_size.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/responsive/responsive.dart';

class TabletProductScreen extends Responsive {
  const TabletProductScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    // - - - - - - - - - - - - - - - - - - INJECT THE CONTROLLER DEPENDENCE - - - - - - - - - - - - - - - - - -  //
    final ProductController controller = Get.put(ProductController());

    // - - - - - - - - - - - - - - - - - - CONSTANT REUSABLE- - - - - - - - - - - - - - - - - -  //
    const radius12 = Radius.circular(12.0);
    final divider = Divider(
        color: grayColor(context).withOpacity(0.2),
        endIndent: getWidth(context) / 8,
        indent: getWidth(context) / 8);

    // - - - - - - - - - - - - - - - - - - SCAFFOLD - - - - - - - - - - - - - - - - - -  //
    return Scaffold(
      body: Obx(
            () => NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: darkDarkLightLightColor(context),
                title: // - - - - - - - - - - - - - - - - - - BRAND - - - - - - - - - - - - - - - - - -  //
                CustomBrand(
                  brand: controller.product.value.brand!,
                  brandColor: darkLightColor(context),
                  textSize: 20,
                ),
                centerTitle: true,
                leading: InkWell(
                  onTap: () => Get.back(),
                  child: Icon(
                    Iconsax.arrow_left_24,
                    size: 30,
                    color: darkLightColor(context),
                  ),
                ),
                actions: [
                  Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CustomIconButton(
                        onHeartClick: controller.onInsertProductIntoWishList,
                        product: controller.product.value,
                        background: grayColor(context),
                        size: 24,
                        iconColor: controller.heart.isTrue
                            ? primaryColor(context)
                            : darkDarkLightLightColor(context),
                      )),
                ],
              )
            ];
          },
          body: controller.errorMsg.value != ""

          // - - - - - - - - - - - - - - - - - - HAS ERROR - - - - - - - - - - - - - - - - - -  //
              ? SizedBox(
              height: getHeight(context),
              width: getWidth(context),
              child: const CustomEmpty(
                text: "Error 404 !",
                icon: Iconsax.message_remove,
              ))

          // - - - - - - - - - - - - - - - - - - SHOW DATA - - - - - - - - - - - - - - - - - -  //
              : SingleChildScrollView(
            child: SizedBox(
              width: getWidth(context),
              child: Column(
                children: [
                  // - - - - - - - - - - - - - - - - - - CAROUSEL IMAGES - - - - - - - - - - - - - - - - - -  //
                  CustomCarouselProductImages(
                      controller: controller.pageController,
                      images: controller.product.value.productListImages(),
                      sizeHeight: getWidth(context)*0.9,
                      viewportFraction: 0.6,
                      onPageChange: (index, _) {
                        controller.currentPageIndex.value = index;
                      },
                      currentIndex: controller.currentPageIndex.value),

                  // - - - - - - - - - - - - - - - - - - CONTAINER INFO SECTION - - - - - - - - - - - - - - - - - -  //
                  Container(
                    decoration: BoxDecoration(
                        color: darkDarkLightLightColor(context),
                        borderRadius: const BorderRadius.only(
                            topLeft: radius12, topRight: radius12)),
                    width: getWidth(context),
                    padding: const EdgeInsets.symmetric(
                        vertical: CustomSizes.SPACE_DEFAULT,
                        horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // - - - - - - - - - - - - - - - - - - TITLE - - - - - - - - - - - - - - - - - -  //
                        Text("${controller.product.value.title} .",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                              fontSize: 30,
                                wordSpacing: 2,
                                color: darkLightColor(context))),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_BETWEEN_ITEMS),

                        Row(children: [
                          // - - - - - - - - - - - - - - - - - - DISCOUNT - - - - - - - - - - - - - - - - - -  //
                          CustomTextBox(
                              oldPrice:
                              controller.product.value.oldPrice!,
                              price: controller.product.value.price!),

                          // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                          const SizedBox(
                              width: CustomSizes.SPACE_BETWEEN_ITEMS),

                          // - - - - - - - - - - - - - - - - - - PRICES - - - - - - - - - - - - - - - - - -  //
                          CustomPrices(
                            oldPrice: controller.product.value.oldPrice!,
                            price: controller.product.value.price!,
                            displayPricesVertical: false,
                          ),
                        ]),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_BETWEEN_ITEMS),

                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    // - - - - - - - - - - - - - - - - - - RATING ICON - - - - - - - - - - - - - - - - - -  //
                                    Icon(
                                      Iconsax.star5,
                                      size: 20,
                                      color: yellowColor(context),
                                    ),

                                    // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                                    const SizedBox(
                                        width: CustomSizes
                                            .SPACE_BETWEEN_ITEMS /
                                            4),

                                    // - - - - - - - - - - - - - - - - - - RATING - - - - - - - - - - - - - - - - - -  //
                                    Text("5.0 (+99)",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                            fontSize: 18,
                                            color: darkLightColor(
                                                context)
                                                .withOpacity(0.8))),
                                  ],
                                ),

                                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                                const SizedBox(
                                    height:
                                    CustomSizes.SPACE_BETWEEN_ITEMS /
                                        2),

                                // - - - - - - - - - - - - - - - - - - STOCK ROW - - - - - - - - - - - - - - - - - -  //
                                Row(
                                  children: [
                                    // - - - - - - - - - - - - - - - - - - STOCK TITLE - - - - - - - - - - - - - - - - - -  //
                                    Text("Stock : ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall?.copyWith(fontSize: 18)),

                                    // - - - - - - - - - - - - - - - - - - IN / OUT STOCK - - - - - - - - - - - - - - - - - -  //
                                    Text(
                                        controller.product.value.inStock!
                                            ? "In Stock"
                                            : "Out Stock",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                            fontSize: 18,
                                            color: controller.product
                                                .value.inStock!
                                                ? CustomColors.GREEN
                                                : CustomColors.RED))
                                  ],
                                ),
                              ],
                            ),

                            // - - - - - - - - - - - - - - - - - - SHARE ICON - - - - - - - - - - - - - - - - - -  //
                            InkWell(
                              onTap: controller.onShareIcon,
                              child: Icon(
                                Iconsax.direct_up,
                                size: 30,
                                color: darkLightColor(context),
                              ),
                            )
                          ],
                        ),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_DEFAULT),

                        // - - - - - - - - - - - - - - - - - - SIZE TITLE - - - - - - - - - - - - - - - - - -  //
                        Text("Size",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_BETWEEN_ITEMS),

                        // - - - - - - - - - - - - - - - - - - PRODUCT SIZES  - - - - - - - - - - - - - - - - - -  //
                        Obx(()=>CustomSize(
                            sizeSelected: controller.sizeSelected.value!,
                            onSizeChange: controller.updateSize,
                            sizes: controller.productSizes,
                            background: grayColor(context),
                            textColor: CustomColors.BLACK,
                            icon: const Icon(Iconsax.add, size: 12)),
                        ),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                        // - - - - - - - - - - - - - - - - - - PRODUCT SIZES  - - - - - - - - - - - - - - - - - -  //
                        CustomElevatedButton(
                            text: "Checkout",
                            onClick: () {
                              controller.onCheckOut(
                                  product: controller.product.value,
                                  deviceType: DeviceType.MOBILE);
                            },
                            height: CustomSizes.TABLET_ELEVATED_BUTTON,),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                        // - - - - - - - - - - - - - - - - - - DESCRIPTION TITLE - - - - - - - - - - - - - - - - - -  //
                        Text("Description",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall?.copyWith(fontSize: 30)),
                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_BETWEEN_ITEMS),

                        // - - - - - - - - - - - - - - - - - - DESCRIPTION BODY - - - - - - - - - - - - - - - - - -  //
                        ReadMoreText(
                          controller.product.value.description ?? "",
                          trimMode: TrimMode.Line,
                          trimExpandedText: " show less",
                          trimCollapsedText: " read more",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                              fontSize: 16,
                              color: isDark(context)
                                  ? CustomColors.WHITE
                                  .withOpacity(0.7)
                                  : CustomColors.BLACK
                                  .withOpacity(0.7)),
                          moreStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: primaryColor(context)),
                          lessStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: primaryColor(context)),
                        ),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                        // - - - - - - - - - - - - - - - - - - DIVIDER - - - - - - - - - - - - - - - - - -  //
                        divider,

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                        // - - - - - - - - - - - - - - - - - - GO TO REVIEWS SCREEN - - - - - - - - - - - - - - - - - -  //
                        InkWell(
                          onTap: () => controller.navigateToReviewsScreen(
                              deviceType: DeviceType.MOBILE),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Reviews (+99)",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall?.copyWith(fontSize: 24)),
                              Icon(
                                Iconsax.arrow_right_3,
                                size: 30,
                                color: darkLightColor(context),
                              )
                            ],
                          ),
                        ),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                        // - - - - - - - - - - - - - - - - - - DIVIDER - - - - - - - - - - - - - - - - - -  //
                        divider,

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                        Text("Product Images",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall?.copyWith(fontSize: 24)),
                        const SizedBox(
                            height: CustomSizes.SPACE_BETWEEN_ITEMS),

                        // - - - - - - - - - - - - - - - - - - THUMBNAIL 1 - - - - - - - - - - - - - - - - - -  //
                        CustomImageNetwork(
                            height: getWidth(context) * 1.2,
                            width: getWidth(context),
                            src: controller.product.value.thumbnail1!,
                            product: controller.product.value),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_BETWEEN_ITEMS),

                        // - - - - - - - - - - - - - - - - - - THUMBNAIL 2 - - - - - - - - - - - - - - - - - -  //
                        CustomImageNetwork(
                            height: getWidth(context) * 1.2,
                            width: getWidth(context),
                            src: controller.product.value.thumbnail2!,
                            product: controller.product.value),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_BETWEEN_ITEMS),

                        // - - - - - - - - - - - - - - - - - - THUMBNAIL 3 - - - - - - - - - - - - - - - - - -  //
                        CustomImageNetwork(
                            height: getWidth(context) * 1.2,
                            width: getWidth(context),
                            src: controller.product.value.thumbnail3!,
                            product: controller.product.value),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_BETWEEN_ITEMS),

                        // - - - - - - - - - - - - - - - - - - THUMBNAIL 4 - - - - - - - - - - - - - - - - - -  //
                        CustomImageNetwork(
                            height: getWidth(context) * 1.2,
                            width: getWidth(context),
                            fit: BoxFit.fill,
                            src: controller.product.value.thumbnail4!,
                            product: controller.product.value),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                        divider,

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                        // - - - - - - - - - - - - - - - - - - CONTACT US - - - - - - - - - - - - - - - - - -  //
                        const ContactUs(),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                        // - - - - - - - - - - - - - - - - - - DIVIDER - - - - - - - - - - - - - - - - - -  //
                        divider,

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                        // - - - - - - - - - - - - - - - - - - CONDITIONS - - - - - - - - - - - - - - - - - -  //
                        const Conditions(),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                        // - - - - - - - - - - - - - - - - - - DIVIDER - - - - - - - - - - - - - - - - - -  //
                        divider,

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_BETWEEN_ITEMS),

                        // - - - - - - - - - - - - - - - - - - COPYRIGHT TEXT - - - - - - - - - - - - - - - - - -  //
                        SizedBox(
                          width: getWidth(context),
                          child: Text(
                            "Copyright © 2024 ${CustomTextStrings.APP_NAME}. All rights reserved",
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      // - - - - - - - - - - - - - - - - - - COUNTER WITH BUTTON ADD TO BAG - - - - - - - - - - - - - - - - - -  //
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: grayColor(context).withOpacity(isDark(context) ? 0.5 : 0.1),
            borderRadius:
            const BorderRadius.only(topLeft: radius12, topRight: radius12)),
        padding: const EdgeInsets.symmetric(
            horizontal: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        width: getWidth(context),
        height: CustomSizes.SPACE_BETWEEN_SECTIONS * 3,
        child: Row(
          children: [
            // - - - - - - - - - - - - - - - - - - COUNTER - - - - - - - - - - - - - - - - - -  //
            Obx(() => CustomCounter(
                counter: controller.counter.value.toString(),
                size: 6,
                onDecrement: controller.decrementTheCounter,
                onIncrement: controller.incrementTheCounter)),

            // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

            // - - - - - - - - - - - - - - - - - - BUTTON ADD TO BAG - - - - - - - - - - - - - - - - - -  //
            Expanded(
              child: CustomElevatedButton(
                text: "Add to Bag",
                onClick: () {
                  controller.onAddToBag(
                      product: controller.product.value,
                      deviceType: DeviceType.MOBILE);
                },
                height: CustomSizes.TABLET_ELEVATED_BUTTON,
              ),
            )
          ],
        ),
      ),
    );
  }
}
