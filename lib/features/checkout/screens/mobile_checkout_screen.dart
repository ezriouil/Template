import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_brand.dart';
import 'package:test1/common/widgets/custom_elevated_button.dart';
import 'package:test1/common/widgets/custom_image_network.dart';
import 'package:test1/features/checkout/checkout_controller.dart';
import 'package:test1/features/checkout/widgets/custom_promo_code.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_icon_strings.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
          child: Column(
            children: [
              SizedBox(
                width: getWidth(context),
                height: getHeight(context) * 0.3,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    controller: controller.scrollController,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) => ListTile(
                          leading: const CustomImageNetwork(
                            src:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPm5-09U3905IKZGo1EuFsNmLhOoww1toGr9efKOGEkQ&s",
                            width: 50,
                            height: 50,
                            fit: BoxFit.fill,
                          ),
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: const CustomBrand(brand: "zara"),
                          subtitle: Text("Jacket noir v3 sport new",
                              style: Theme.of(context).textTheme.bodyLarge),
                        )),
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
              CustomPromoCode(
                  controller: controller.codePromoController,
                  validator: (text) {},
                  onClick: () {}),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
              Container(
                  padding:
                      const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          CustomSizes.SPACE_BETWEEN_ITEMS),
                      border: Border.all(color: darkLightColor(context))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        visualDensity:
                            const VisualDensity(horizontal: 0, vertical: -4),
                        leading: Text("Subtotal",
                            style: Theme.of(context).textTheme.bodySmall),
                        trailing: Text("1500.00 MAD",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        visualDensity:
                            const VisualDensity(horizontal: 0, vertical: -4),
                        leading: Text("Shipping Fee",
                            style: Theme.of(context).textTheme.bodySmall),
                        trailing: Text("00.00 MAD",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        visualDensity:
                            const VisualDensity(horizontal: 0, vertical: -4),
                        leading: Text("Tax Fee",
                            style: Theme.of(context).textTheme.bodySmall),
                        trailing: Text("00.00 MAD",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Text("Order Total",
                            style: Theme.of(context).textTheme.headlineSmall),
                        trailing: Text("1350 MAD",
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                      Divider(color: grayColor(context)),
                      ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Text("Payment Methode",
                              style: Theme.of(context).textTheme.headlineSmall),
                          trailing: InkWell(
                            onTap: controller.onChangePaymentMethod,
                            child: Text("change",
                                style: Theme.of(context).textTheme.bodySmall),
                          )),
                      ListTile(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          leading: Image.asset(CustomIconStrings.MASTER_CARD),
                          title: Text("offline",
                              style: Theme.of(context).textTheme.bodyMedium)),
                      Divider(color: grayColor(context)),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Text("Shipping Address",
                            style: Theme.of(context).textTheme.headlineSmall),
                        trailing: Text("change",
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        visualDensity:
                            const VisualDensity(horizontal: -4, vertical: -4),
                        leading: const Icon(Iconsax.user, size: 20),
                        title: Text("mohamed ezriouil",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        visualDensity:
                            const VisualDensity(horizontal: -4, vertical: -4),
                        leading: const Icon(Iconsax.call, size: 20),
                        title: Text("0624778355",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        visualDensity:
                            const VisualDensity(horizontal: -4, vertical: -4),
                        leading: const Icon(Iconsax.location, size: 20),
                        title: Text(
                            "Hay salam agadir, 80000 ,morocco,sous massa",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ),
                    ],
                  )),
            ],
          ),
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
      ),
      // - - - - - - - - - - - - - - - - - - BOTTOM NAVIGATION BAR - - - - - - - - - - - - - - - - - -  //
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
                topRight: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS))),
        padding: const EdgeInsets.symmetric(
            horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
        width: getWidth(context),
        child: // - - - - - - - - - - - - - - - - - - BUTTON ADD TO BAG - - - - - - - - - - - - - - - - - -  //
            CustomElevatedButton(
          text: "Checkout",
          onClick: controller.onCheckout,
          width: getWidth(context),
          style: ElevatedButton.styleFrom(
              side: const BorderSide(color: CustomColors.TRANSPARENT)),
        ),
      ),
    );
  }
}
