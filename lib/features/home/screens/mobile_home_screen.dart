import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_grid_view.dart';
import 'package:test1/common/widgets/custom_product_vertical.dart';
import 'package:test1/common/widgets/custom_text_field.dart';
import 'package:test1/data/models/product.dart';
import 'package:test1/features/home/home_controller.dart';
import 'package:test1/features/product/widgets/custom_carousel_product_images.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/extensions/validator.dart';
import 'package:test1/utils/responsive/responsive.dart';

class MobileHomeScreen extends Responsive {
  const MobileHomeScreen({
    super.key,
  });

  @override
  Widget execute(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    var x = "Jeans";
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
                        )
                      ]),
                    ),
                    automaticallyImplyLeading: false,
                    backgroundColor: primaryColor(context))
              ];
            },

            // - - - - - - - - - - - - - - - - - - BODY - - - - - - - - - - - - - - - - - -  //
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: getWidth(context),
                    height: 230,
                    decoration: BoxDecoration(
                        color: primaryColor(context),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: radius24, bottomRight: radius24)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                              horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: CustomTextField(
                                    hint: "Search in store",
                                    validator: (value) =>
                                        Validator.validateEmptyField(
                                            "Search in store", value),
                                    width: getWidth(context),
                                    leadingIcon: Iconsax.search_normal,
                                    controller: TextEditingController(),
                                    readOnly: true,
                                    backgroundColor:
                                        darkDarkLightLightColor(context),
                                    withDefaultPadding: false),
                              ),
                              const SizedBox(
                                  height: CustomSizes.SPACE_BETWEEN_ITEMS),
                              Text("Popular Categories",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(color: CustomColors.WHITE)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 93,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index) =>
                                  InkWell(
                                    onTap: () {},
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: darkDarkLightLightColor(
                                                  context),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          padding: const EdgeInsets.all(
                                              CustomSizes.SPACE_BETWEEN_ITEMS /
                                                  1.5),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: CustomSizes
                                                      .SPACE_BETWEEN_ITEMS /
                                                  2),
                                          child: Icon(Iconsax.check,
                                              color: darkLightColor(context)),
                                        ),
                                        Text(
                                            x.length <= 5
                                                ? x
                                                : x
                                                    .substring(0, 5)
                                                    .replaceRange(5, 5, "..."),
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
                              "https://www.thoughtco.com/thmb/ctxxtfGGeK5f_-S3f8J-jbY-Gp8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/close-up-of-clothes-hanging-in-row-739240657-5a78b11f8e1b6e003715c0ec.jpg",
                              "https://www.thoughtco.com/thmb/ctxxtfGGeK5f_-S3f8J-jbY-Gp8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/close-up-of-clothes-hanging-in-row-739240657-5a78b11f8e1b6e003715c0ec.jpg",
                              "https://www.thoughtco.com/thmb/ctxxtfGGeK5f_-S3f8J-jbY-Gp8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/close-up-of-clothes-hanging-in-row-739240657-5a78b11f8e1b6e003715c0ec.jpg"
                            ],
                            sizeHeight: getWidth(context) / 2,
                            indicatorColor: darkDarkLightLightColor(context),
                            onPageChange: (index, _) {
                              controller.currentPageIndex.value = index;
                            },
                            currentIndex: controller.currentPageIndex.value),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: CustomSizes.SPACE_DEFAULT,
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
                            CustomGridView(
                                count: 10,
                                controller: controller.scrollController,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        CustomProductVertical(
                                          onClick: (int id) {},
                                          product: Product(
                                              title: "T-shirt sport",
                                              discount: 1,
                                              brand: "France CL",
                                              price: 200,
                                              oldPrice: 250,
                                              thumbnail1:
                                                  "https://contents.mediadecathlon.com/p2436315/e957bd6a23553ffabaef22fd550e99c3/p2436315.jpg?format=auto&quality=70&f=650x0"),
                                          onHeartClick: (Product product) {},
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
