import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/features/checkout/checkout_controller.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/responsive/responsive.dart';

class MobileCheckoutScreen extends Responsive {
  const MobileCheckoutScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    // - - - - - - - - - - - - - - - - - - INSTANCE FROM THE CONTROLLER - - - - - - - - - - - - - - - - - -  //
    final CheckoutController controller = Get.put(CheckoutController());

    // - - - - - - - - - - - - - - - - - - Controller - - - - - - - - - - - - - - - - - -  //
    return Scaffold(
        appBar: AppBar(
          title: Text("Checkout",
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
        body: SingleChildScrollView(
          controller: controller.scrollController,
          child: const Column(
            children: [],
          ),
        ),
        floatingActionButton: Obx(
          () => AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: controller.showFloatingActionButton.value ? 1.0 : 0.0,
            child: FloatingActionButton(
              onPressed: () {
                controller.scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.fastOutSlowIn);
              },
              elevation: 16.0,
              backgroundColor: primaryColor(context),
              child: const Icon(Iconsax.arrow_up_24, color: CustomColors.WHITE),
            ),
          ),
        ));
  }
}
