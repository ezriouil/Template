import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_elevated_button.dart';
import 'package:test1/common/widgets/custom_grid_view.dart';
import 'package:test1/features/cart/cart_controller.dart';
import 'package:test1/features/cart/widgets/custom_cart_tile.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/responsive/responsive.dart';

class TabletCartScreen extends Responsive {
  const TabletCartScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    // - - - - - - - - - - - - - - - - - - INSTANCE FROM THE CONTROLLER - - - - - - - - - - - - - - - - - -  //
    final CartController controller = Get.put(CartController());
    const radius12 = Radius.circular(12.0);

    // - - - - - - - - - - - - - - - - - - Controller - - - - - - - - - - - - - - - - - -  //
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontSize: 40, color: darkLightColor(context))),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Iconsax.arrow_left_24,
            color: darkLightColor(context),
          ),
        ),
      ),

      // - - - - - - - - - - - - - - - - - - LIST VIEW - - - - - - - - - - - - - - - - - -  //
      body: Obx(
        () => CustomGridView(
            itemBuilder: (BuildContext context, int index) => CustomCartTile(
                product: controller.cartProducts[index],
                onIncrement: () {
                  controller.incrementTheCounter(
                      product: controller.cartProducts[index]);
                },
                onDecrement: () {
                  controller.decrementTheCounter(
                      product: controller.cartProducts[index]);
                }),
            count: controller.cartProducts.length),
      ),

      // - - - - - - - - - - - - - - - - - - BOTTOM NAVIGATION BAR - - - - - - - - - - - - - - - - - -  //
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            borderRadius:
                BorderRadius.only(topLeft: radius12, topRight: radius12)),
        padding: const EdgeInsets.symmetric(
            horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
        width: getWidth(context),
        child: // - - - - - - - - - - - - - - - - - - BUTTON ADD TO BAG - - - - - - - - - - - - - - - - - -  //
            Obx(
          () => CustomElevatedButton(
            text: controller.total.value > 0
                ? "Checkout ${controller.total.value - 1}.99"
                : "0.00",
            onClick: () => controller.onCheckout(deviceType: DeviceType.MOBILE),
            height: CustomSizes.TABLET_ELEVATED_BUTTON,
            style: ElevatedButton.styleFrom(
                side: const BorderSide(color: CustomColors.TRANSPARENT)),
          ),
        ),
      ),
    );
  }
}
