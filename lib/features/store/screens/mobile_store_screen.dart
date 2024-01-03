import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_product_vertical.dart';
import 'package:test1/common/widgets/custom_text_field.dart';
import 'package:test1/data/models/product.dart';
import 'package:test1/features/store/store_controller.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
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
                            child: Icon(Iconsax.bag_24,
                                color: darkLightColor(context))),
                      ),
                      Positioned(
                        right: CustomSizes.SPACE_BETWEEN_ITEMS,
                        child: Badge(backgroundColor: primaryColor(context)),
                      )
                    ])
                  ],
                  centerTitle: false,
                )
              ];
            },

            // - - - - - - - - - - - - - - - - - - BODY - - - - - - - - - - - - - - - - - -  //
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                                child: const Icon(Icons.filter_list, size: 30)))
                      ],
                    ),
                  ),
                  CustomGridView(
                      count: 10,
                      spaceBetweenColumns: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                      spaceBetweenRows: CustomSizes.SPACE_BETWEEN_ITEMS / 4,
                      controller: controller.scrollController,
                      itemBuilder: (BuildContext context, int index) =>
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
              ),
            )));
  }
}
