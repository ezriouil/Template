import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_elevated_button.dart';
import 'package:test1/features/cart/cart_controller.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
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
                ?.copyWith(color: darkLightColor(context))),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Iconsax.arrow_left_24,
            color: darkLightColor(context),
          ),
        ),
      ),
      body: const Placeholder(),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            borderRadius:
                BorderRadius.only(topLeft: radius12, topRight: radius12)),
        padding: const EdgeInsets.symmetric(
            horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
        width: getWidth(context),
        child: // - - - - - - - - - - - - - - - - - - BUTTON ADD TO BAG - - - - - - - - - - - - - - - - - -  //
            CustomElevatedButton(
          text: "Checkout ${controller.total.value - 1}.99",
          onClick: (){},
          width: getWidth(context),
          style: ElevatedButton.styleFrom(
              side: const BorderSide(color: CustomColors.TRANSPARENT)),
        ),
      ),
    );
  }
}
