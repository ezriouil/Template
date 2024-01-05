import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test1/common/widgets/custom_empty.dart';
import 'package:test1/common/widgets/custom_grid_view.dart';
import 'package:test1/common/widgets/custom_product_vertical.dart';
import 'package:test1/common/widgets/custom_shimmer_effect.dart';
import 'package:test1/data/models/product.dart';
import 'package:test1/features/home/home_controller.dart';
import 'package:test1/features/product/widgets/custom_carousel_product_images.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/responsive/responsive.dart';

class MobileHomeScreen extends Responsive {
  const MobileHomeScreen({
    super.key,
  });

  @override
  Widget execute(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    controller.deviceType = DeviceType.MOBILE;
    const radius24 = Radius.circular(CustomSizes.SPACE_DEFAULT);
    return Scaffold(
        body: NestedScrollView(
            controller: controller.scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                // - - - - - - - - - - - - - - - - - - APP BAR - - - - - - - - - - - - - - - - - -  //
                SliverAppBar(
                    title: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text("Good day for shopping !",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: CustomColors.WHITE)),
                      subtitle: Text("Mohamed ezriouil",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: CustomColors.WHITE)),
                      trailing: Stack(children: [
                        InkWell(
                            onTap: () {},
                            child: const Icon(Iconsax.bag_24,
                                color: CustomColors.WHITE)),
                        const Positioned(
                          right: 0,
                          child: Badge(backgroundColor: CustomColors.WHITE),
                        ),
                      ]),
                    ),
                    automaticallyImplyLeading: false,
                    backgroundColor: CustomColors.GREY_DARK)
              ];
            },

            // - - - - - - - - - - - - - - - - - - BODY - - - - - - - - - - - - - - - - - -  //
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: getWidth(context),
                    height: 210,
                    decoration: const BoxDecoration(
                        color: CustomColors.GREY_DARK,
                        borderRadius: BorderRadius.only(
                            bottomLeft: radius24, bottomRight: radius24)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 4,
                              horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: controller.onNavigateToShopScreen,
                                child: Container(
                                  height: 58,
                                  width: getWidth(context),
                                  margin: const EdgeInsets.symmetric(
                                      vertical:
                                          CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                  decoration: BoxDecoration(
                                      color: CustomColors.WHITE,
                                      borderRadius: BorderRadius.circular(
                                          CustomSizes.SPACE_BETWEEN_ITEMS)),
                                  child: ListTile(
                                      leading: Icon(Iconsax.search_normal,
                                          color: grayColor(context)
                                              .withOpacity(0.5)),
                                      trailing: Icon(Iconsax.filter,
                                          color: grayColor(context)
                                              .withOpacity(0.5)),
                                      title: Text("Search in store",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  color: grayColor(context)
                                                      .withOpacity(0.5)))),
                                ),
                              ),
                              const SizedBox(
                                  height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                              Text("Popular Categories",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(color: CustomColors.WHITE)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.categories.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  InkWell(
                                    onTap: controller.onNavigateToShopScreen,
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: darkDarkLightLightColor(
                                                  context)),
                                          padding: const EdgeInsets.all(
                                              CustomSizes.SPACE_BETWEEN_ITEMS /
                                                  1.5),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: CustomSizes
                                                      .SPACE_BETWEEN_ITEMS /
                                                  2),
                                          child: Image.asset(
                                              controller.categories[index],
                                              height: 26,
                                              width: 26,
                                              color: darkLightColor(context)),
                                        ),
                                        const SizedBox(
                                            height: CustomSizes
                                                    .SPACE_BETWEEN_ITEMS /
                                                4),
                                        Text(
                                            "${controller.categories[index].replaceAll("assets/icons/categories/", "").substring(0, 4)}..",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                    color: CustomColors.WHITE,
                                                    fontWeight:
                                                        FontWeight.w300))
                                      ],
                                    ),
                                  )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                  Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCarouselProductImages(
                            controller: controller.pageController,
                            images: const [
                              "https://ma.jumia.is/cms/000_2024/000001_Janvier/SodesHiver/UND/TV/SX.gif",
                              "https://imgaz.staticbg.com/banggood/os/202401/20240101200711_835.jpg",
                              "https://ma.jumia.is/cms/000_2024/000001_Janvier/SodesHiver/SX_Solde.jpg"
                            ],
                            effect: const SwapEffect(
                                activeDotColor: CustomColors.BLACK,
                                dotHeight: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                                dotWidth: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            sizeHeight: getWidth(context) / 2.5,
                            indicatorColor: darkDarkLightLightColor(context),
                            onPageChange: (index, _) {
                              controller.currentPageIndex.value = index;
                            },
                            currentIndex: controller.currentPageIndex.value),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical:
                                      CustomSizes.SPACE_BETWEEN_SECTIONS / 2,
                                  horizontal:
                                      CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Popular Products",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
                                  Text("View all",
                                      style:
                                          Theme.of(context).textTheme.bodySmall)
                                ],
                              ),
                            ),
                            // - - - - - - - - - - - - - - - - - - LOADING STATE TRUE - - - - - - - - - - - - - - - - - -  //
                            controller.isLoading.isTrue
                                ? CustomShimmerEffect(
                              itemsHeight: 320,
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
                                                text: "No Products Available !"),
                                          )

                                        // - - - - - - - - - - - - - - - - - - SHOW DATA - - - - - - - - - - - - - - - - - -  //
                                        : CustomGridView(
                                            spaceBetweenColumns: CustomSizes
                                                    .SPACE_BETWEEN_ITEMS /
                                                2,
                                            spaceBetweenRows: CustomSizes
                                                    .SPACE_BETWEEN_ITEMS /
                                                4,
                                            count:
                                                controller.productsLists.length,
                                            controller:
                                                controller.scrollController,
                                            itemBuilder: (BuildContext context,
                                                    int index) =>
                                                CustomProductVertical(
                                                  onClick: (int id) {
                                                    controller
                                                        .onNavigateToProductScreen(
                                                            id: id);
                                                  },
                                                  product: controller
                                                      .productsLists[index],
                                                  onHeartClick:
                                                      (Product product) {},
                                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}