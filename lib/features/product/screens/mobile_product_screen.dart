import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:test1/data/models/product.dart';
import 'package:test1/features/product/product_controller.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/responsive/responsive.dart';

class MobileProductScreen extends Responsive {
  const MobileProductScreen({super.key});

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
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: grayColor(context).withOpacity(0.0),
                  statusBarIconBrightness:
                  isDark(context) ? Brightness.light : Brightness.light),
              backgroundColor:
              grayColor(context).withOpacity(isDark(context) ? 0.6 : 0.3),
              title: null,
              leading: InkWell(
                onTap: () => Get.back(),
                child: Icon(
                  Iconsax.arrow_left_24,
                  color: darkLightColor(context),
                ),
              ),
              actions: [
                Obx(
                      () =>
                      Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: CustomIconButton(
                            onHeartClick: controller
                                .onInsertProductIntoWishList,
                            product: controller.testProduct,
                            iconColor: controller.heart.isTrue
                                ? primaryColor(context)
                                : darkLightColor(context),
                          )),
                ),
              ],
            )
          ];
        },
        body: Obx(
              () =>
          controller.errorMsg.value == null

          // - - - - - - - - - - - - - - - - - - HAS ERROR - - - - - - - - - - - - - - - - - -  //

              ? SizedBox(
              height: getHeight(context),
              width: getWidth(context),
              child: const CustomEmpty(
                text: "Error 404 !",
                icon: Iconsax.message_remove,
              ))
              : controller.product.value == controller.emptyProduct()

          // - - - - - - - - - - - - - - - - - - LIST EMPTY - - - - - - - - - - - - - - - - - -  //

              ? SizedBox(
            height: getHeight(context),
            width: getWidth(context),
            child: const CustomEmpty(
                text: "This product not available !"),
          )

          // - - - - - - - - - - - - - - - - - - SHOW DATA - - - - - - - - - - - - - - - - - -  //

              : SingleChildScrollView(
            child: Container(
              color: grayColor(context)
                  .withOpacity(isDark(context) ? 0.6 : 0.3),
              width: getWidth(context),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: CustomSizes.SPACE_BETWEEN_ITEMS),
                    child: Row(
                      // - - - - - - - - - - - - - - - - - - THUMBNAILS PRODUCT - - - - - - - - - - - - - - - - - -  //
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                // - - - - - - - - - - - - - - - - - - THUMBNAIL 1 - - - - - - - - - - - - - - - - - -  //
                                CustomImageNetwork(
                                  height: controller
                                      .mainThumbnail.value ==
                                      controller
                                          .testProduct.thumbnail1
                                      ? 60
                                      : 50,
                                  width: controller
                                      .mainThumbnail.value ==
                                      controller
                                          .testProduct.thumbnail1
                                      ? 60
                                      : 50,
                                  onSelected: (Product product) {
                                    controller.updateMainThumbnail(
                                        product.thumbnail1);
                                  },
                                  src: controller
                                      .testProduct.thumbnail1!,
                                  product: controller.testProduct,
                                ),

                                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                                const SizedBox(
                                    height: CustomSizes
                                        .SPACE_BETWEEN_ITEMS /
                                        3),

                                // - - - - - - - - - - - - - - - - - - THUMBNAIL 2 - - - - - - - - - - - - - - - - - -  //
                                CustomImageNetwork(
                                  height: controller
                                      .mainThumbnail.value ==
                                      controller
                                          .testProduct.thumbnail2
                                      ? 60
                                      : 50,
                                  width: controller
                                      .mainThumbnail.value ==
                                      controller
                                          .testProduct.thumbnail2
                                      ? 60
                                      : 50,
                                  onSelected: (Product product) {
                                    controller.updateMainThumbnail(
                                        product.thumbnail2);
                                  },
                                  src: controller
                                      .testProduct.thumbnail2!,
                                  product: controller.testProduct,
                                ),

                                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                                const SizedBox(
                                    height: CustomSizes
                                        .SPACE_BETWEEN_ITEMS /
                                        3),

                                // - - - - - - - - - - - - - - - - - - THUMBNAILS 3  - - - - - - - - - - - - - - - - - -  //
                                CustomImageNetwork(
                                  height: controller
                                      .mainThumbnail.value ==
                                      controller
                                          .testProduct.thumbnail3
                                      ? 60
                                      : 50,
                                  width: controller
                                      .mainThumbnail.value ==
                                      controller
                                          .testProduct.thumbnail3
                                      ? 60
                                      : 50,
                                  onSelected: (Product product) {
                                    controller.updateMainThumbnail(
                                        product.thumbnail3);
                                  },
                                  src: controller
                                      .testProduct.thumbnail3!,
                                  product: controller.testProduct,
                                ),

                                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                                const SizedBox(
                                    height: CustomSizes
                                        .SPACE_BETWEEN_ITEMS /
                                        4),

                                // - - - - - - - - - - - - - - - - - - THUMBNAIL 4 - - - - - - - - - - - - - - - - - -  //
                                CustomImageNetwork(
                                  height: controller
                                      .mainThumbnail.value ==
                                      controller
                                          .testProduct.thumbnail4
                                      ? 60
                                      : 50,
                                  width: controller
                                      .mainThumbnail.value ==
                                      controller
                                          .testProduct.thumbnail4
                                      ? 60
                                      : 50,
                                  onSelected: (Product product) {
                                    controller.updateMainThumbnail(
                                        product.thumbnail4);
                                  },
                                  src: controller
                                      .testProduct.thumbnail4!,
                                  product: controller.testProduct,
                                )
                              ],
                            )),
                        // - - - - - - - - - - - - - - - - - - MAIN THUMBNAIL - - - - - - - - - - - - - - - - - -  //
                        Obx(
                              () =>
                              Expanded(
                                flex: 3,
                                child: CustomImageNetwork(
                                  height: 300,
                                  width: getWidth(context),
                                  radius:
                                  const BorderRadius.all(radius12),
                                  src: controller.mainThumbnail.value,
                                  product: controller.testProduct,
                                ),
                              ),
                        )
                      ],
                    ),
                  ),
                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(
                      height: CustomSizes.SPACE_BETWEEN_ITEMS),
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
                                width:
                                CustomSizes.SPACE_BETWEEN_ITEMS /
                                    4),

                            // - - - - - - - - - - - - - - - - - - RATING - - - - - - - - - - - - - - - - - -  //
                            Text("5.0 (+99)",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                    color: darkLightColor(context)
                                        .withOpacity(0.8))),

                            // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                            const Spacer(),

                            // - - - - - - - - - - - - - - - - - - SHARE ICON - - - - - - - - - - - - - - - - - -  //
                            InkWell(
                              onTap: controller.onShareIcon,
                              child: Icon(
                                Iconsax.share,
                                color: darkLightColor(context),
                              ),
                            )
                          ],
                        ),
                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height:
                            CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                        Row(children: [
                          // - - - - - - - - - - - - - - - - - - DISCOUNT - - - - - - - - - - - - - - - - - -  //
                          CustomTextBox(
                              oldPrice:
                              controller.testProduct.oldPrice!,
                              price: controller.testProduct.price!),

                          // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                          const SizedBox(
                              width: CustomSizes.SPACE_BETWEEN_ITEMS),

                          // - - - - - - - - - - - - - - - - - - PRICES - - - - - - - - - - - - - - - - - -  //
                          CustomPrices(
                            oldPrice:
                            controller.testProduct.oldPrice!,
                            price: controller.testProduct.price!,
                            displayPricesVertical: false,
                          ),
                        ]),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height:
                            CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height:
                            CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                        // - - - - - - - - - - - - - - - - - - TITLE - - - - - - - - - - - - - - - - - -  //
                        Text("${controller.testProduct.title} .",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                color: darkLightColor(context))),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_BETWEEN_ITEMS),

                        // - - - - - - - - - - - - - - - - - - STOCK ROW - - - - - - - - - - - - - - - - - -  //
                        Row(
                          children: [
                            // - - - - - - - - - - - - - - - - - - STOCK TITLE - - - - - - - - - - - - - - - - - -  //
                            Text("Stock : ",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodySmall),

                            // - - - - - - - - - - - - - - - - - - IN / OUT STOCK - - - - - - - - - - - - - - - - - -  //
                            Text(
                                controller.testProduct.inStock!
                                    ? "In Stock"
                                    : "Out Stock",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                    color: controller
                                        .testProduct.inStock!
                                        ? CustomColors.GREEN
                                        : CustomColors.RED))
                          ],
                        ),
                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_BETWEEN_ITEMS),

                        // - - - - - - - - - - - - - - - - - - BRAND - - - - - - - - - - - - - - - - - -  //
                        Row(
                          children: [
                            Icon(
                              Iconsax.medal_star,
                              size: 20,
                              color: darkLightColor(context),
                            ),
                            const SizedBox(
                                width:
                                CustomSizes.SPACE_BETWEEN_ITEMS /
                                    2),
                            CustomBrand(
                              brand: controller.testProduct.brand!,
                              brandColor: darkLightColor(context),
                            ),
                          ],
                        ),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height:
                            CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height:
                            CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                        // - - - - - - - - - - - - - - - - - - SIZE TITLE - - - - - - - - - - - - - - - - - -  //
                        Text("Size",
                            style: Theme
                                .of(context)
                                .textTheme
                                .headlineSmall),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height:
                            CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                        // - - - - - - - - - - - - - - - - - - PRODUCT SIZES  - - - - - - - - - - - - - - - - - -  //
                        SizedBox(
                          width: getWidth(context),
                          height: 50,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                              controller.productSizes.length,
                              itemBuilder: (BuildContext context,
                                  int index) =>
                                  Padding(
                                      padding:
                                      const EdgeInsets.all(8.0),
                                      child: Obx(
                                            () =>
                                            CustomTextBox(
                                              verticalPadding: 8,
                                              horizontalPadding: 20,
                                              background: controller
                                                  .sizeSelected
                                                  .value ==
                                                  controller
                                                      .productSizes[
                                                  index]
                                                  ? primaryColor(context)
                                                  : grayColor(context)
                                                  .withOpacity(
                                                  isDark(context)
                                                      ? 0.6
                                                      : 0.3),
                                              textColor:
                                              CustomColors.WHITE,
                                              text: controller
                                                  .productSizes[index],
                                              icon: controller
                                                  .sizeSelected
                                                  .value ==
                                                  controller
                                                      .productSizes[
                                                  index]
                                                  ? const Icon(
                                                  Icons.check,
                                                  color: CustomColors
                                                      .WHITE,
                                                  size: 18)
                                                  : null,
                                              onSelected:
                                              controller.updateSize,
                                            ),
                                      ))),
                        ),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_DEFAULT),

                        // - - - - - - - - - - - - - - - - - - PRODUCT SIZES  - - - - - - - - - - - - - - - - - -  //
                        CustomElevatedButton(
                            text: "Checkout",
                            onClick: (){controller.onCheckOut(id: controller.testProduct.id ?? 1, deviceType: DeviceType.MOBILE);},
                            width: getWidth(context)),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_DEFAULT),

                        // - - - - - - - - - - - - - - - - - - DESCRIPTION TITLE - - - - - - - - - - - - - - - - - -  //
                        Text("Description",
                            style: Theme
                                .of(context)
                                .textTheme
                                .headlineSmall),
                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height:
                            CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                        // - - - - - - - - - - - - - - - - - - DESCRIPTION BODY - - - - - - - - - - - - - - - - - -  //
                        ReadMoreText(
                          controller.testProduct.description ?? "",
                          trimMode: TrimMode.Line,
                          trimExpandedText: " show less",
                          trimCollapsedText: " read more",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                              color: isDark(context)
                                  ? CustomColors.WHITE
                                  .withOpacity(0.7)
                                  : CustomColors.BLACK
                                  .withOpacity(0.7)),
                          moreStyle: Theme
                              .of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                              color: primaryColor(context)),
                          lessStyle: Theme
                              .of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                              color: primaryColor(context)),
                        ),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_DEFAULT),

                        // - - - - - - - - - - - - - - - - - - DIVIDER - - - - - - - - - - - - - - - - - -  //
                        divider,

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_DEFAULT),

                        // - - - - - - - - - - - - - - - - - - GO TO REVIEWS SCREEN - - - - - - - - - - - - - - - - - -  //
                        InkWell(
                          onTap: () =>
                              controller.navigateToReviewsScreen(
                                  deviceType: DeviceType.MOBILE),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Reviews (+99)",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headlineSmall),
                              Icon(
                                Iconsax.arrow_right_3,
                                color: darkLightColor(context),
                              )
                            ],
                          ),
                        ),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_DEFAULT),

                        // - - - - - - - - - - - - - - - - - - DIVIDER - - - - - - - - - - - - - - - - - -  //
                        divider,

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_DEFAULT),

                        Text("Product Images",
                            style: Theme
                                .of(context)
                                .textTheme
                                .headlineSmall),
                        const SizedBox(
                            height: CustomSizes.SPACE_BETWEEN_ITEMS),

                        // - - - - - - - - - - - - - - - - - - THUMBNAIL 1 - - - - - - - - - - - - - - - - - -  //
                        CustomImageNetwork(
                            height: getHeight(context) * 0.5,
                            width: getWidth(context),
                            src: controller.testProduct.thumbnail1!,
                            product: controller.testProduct),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_BETWEEN_ITEMS),

                        // - - - - - - - - - - - - - - - - - - THUMBNAIL 2 - - - - - - - - - - - - - - - - - -  //
                        CustomImageNetwork(
                            height: getHeight(context) * 0.5,
                            width: getWidth(context),
                            src: controller.testProduct.thumbnail2!,
                            product: controller.testProduct),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_BETWEEN_ITEMS),

                        // - - - - - - - - - - - - - - - - - - THUMBNAIL 3 - - - - - - - - - - - - - - - - - -  //
                        CustomImageNetwork(
                            height: getHeight(context) * 0.5,
                            width: getWidth(context),
                            src: controller.testProduct.thumbnail3!,
                            product: controller.testProduct),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_BETWEEN_ITEMS),

                        // - - - - - - - - - - - - - - - - - - THUMBNAIL 4 - - - - - - - - - - - - - - - - - -  //
                        CustomImageNetwork(
                            height: getHeight(context) * 0.5,
                            width: getWidth(context),
                            fit: BoxFit.fill,
                            src: controller.testProduct.thumbnail4!,
                            product: controller.testProduct),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_DEFAULT),

                        divider,

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_DEFAULT),

                        // - - - - - - - - - - - - - - - - - - CONTACT US - - - - - - - - - - - - - - - - - -  //
                        const ContactUs(),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_DEFAULT),

                        // - - - - - - - - - - - - - - - - - - DIVIDER - - - - - - - - - - - - - - - - - -  //
                        divider,

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_DEFAULT),

                        // - - - - - - - - - - - - - - - - - - CONDITIONS - - - - - - - - - - - - - - - - - -  //
                        const Conditions(),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_DEFAULT),

                        // - - - - - - - - - - - - - - - - - - DIVIDER - - - - - - - - - - - - - - - - - -  //
                        divider,

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_BETWEEN_ITEMS),

                        // - - - - - - - - - - - - - - - - - - COPYRIGHT TEXT - - - - - - - - - - - - - - - - - -  //
                        SizedBox(
                          width: getWidth(context),
                          child: Text(
                            "Copyright © 2024 ${CustomTextStrings
                                .APP_NAME}. All rights reserved",
                            style:
                            Theme
                                .of(context)
                                .textTheme
                                .bodySmall,
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
            color: grayColor(context).withOpacity(isDark(context) ? 0.6 : 0.3),
            borderRadius:
            const BorderRadius.only(topLeft: radius12, topRight: radius12)),
        padding: const EdgeInsets.symmetric(
            horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
        width: getWidth(context),
        height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2.5,
        child: Row(
          children: [


            // - - - - - - - - - - - - - - - - - - COUNTER - - - - - - - - - - - - - - - - - -  //
            Obx(() =>
                CustomCounter(counter: controller.counter.value.toString(),
                    onDecrement: controller.decrementTheCounter,
                    onIncrement: controller.incrementTheCounter)),

            // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS/2),

            // - - - - - - - - - - - - - - - - - - BUTTON ADD TO BAG - - - - - - - - - - - - - - - - - -  //
            Expanded(
              child: CustomElevatedButton(
                text: "Add to Bag",
                onClick: (){controller.onAddToBag(id: controller.testProduct.id ?? 1, deviceType: DeviceType.MOBILE);},
                width: getWidth(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
