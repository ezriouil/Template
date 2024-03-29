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
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/extensions/validator.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
          child: Column(
            children: [
              Obx(
                () => SizedBox(
                  height: (controller.cartProducts.length) * 70,
                  width: getWidth(context),
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.cartProducts.length,
                      itemBuilder: (BuildContext context, int index) =>
                          ListTile(
                            leading: CustomImageNetwork(
                              src: controller.cartProducts[index].thumbnail1 ??
                                  "",
                              width: 50,
                              height: 50,
                            ),
                            contentPadding: EdgeInsets.zero,
                            title: CustomBrand(
                                brand:
                                    controller.cartProducts[index].brand ?? ""),
                            subtitle: Text(
                                controller.cartProducts[index].title ?? "",
                                style: Theme.of(context).textTheme.bodyLarge),
                            trailing: Text(
                                "x${controller.cartProducts[index].discount}",
                                style: Theme.of(context).textTheme.bodySmall),
                          )),
                ),
              ),
              const SizedBox(
                height: CustomSizes.SPACE_BETWEEN_ITEMS,
              ),
              CustomPromoCode(
                  controller: controller.codePromoController,
                  validator: (value) => Validator.validateEmptyField(
                      CustomTextStrings.SECURITY_CODE, value),
                  onClick: controller.onValidateCodePromo),
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
                        trailing: Text("${controller.subTotal - 1}.99 MAD",
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
                      const SizedBox(
                          height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      Divider(color: grayColor(context)),
                      const SizedBox(
                          height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Text("Payment Methode",
                              style: Theme.of(context).textTheme.headlineSmall),
                          trailing: InkWell(
                            onTap: controller.onChangePaymentMethod,
                            child: Text("change",
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(decoration: TextDecoration.underline)),
                          )),
                      Obx(
                        () => ListTile(
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            leading: Image.asset(
                              controller.methodPaymentSelectedValue.value ==
                                      "Online"
                                  ? CustomIconStrings.PAYMENTS_METHOD_ONLINE
                                  : CustomIconStrings.CASH_ON_DELIVERY,
                              color: darkLightColor(context),
                              height: 30,
                              width: 30,
                            ),
                            title: Text(
                                controller.methodPaymentSelectedValue.value,
                                style: Theme.of(context).textTheme.bodyLarge)),
                      ),
                      const SizedBox(
                          height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      Divider(color: grayColor(context)),
                      const SizedBox(
                          height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Text("Shipping Address",
                            style: Theme.of(context).textTheme.headlineSmall),
                        trailing: InkWell(
                          onTap: controller.onChangeLocationAddress,
                          child: Text("change",
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(decoration: TextDecoration.underline)),
                        ),
                      ),
                      Obx(
                        () => ListTile(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          visualDensity:
                              const VisualDensity(horizontal: -4, vertical: -4),
                          leading: const Icon(Iconsax.user, size: 20),
                          title: Text(
                              controller
                                      .currentLocationAddress.value?.fullName ??
                                  "",
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      ),
                      Obx(
                        () => ListTile(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          visualDensity:
                              const VisualDensity(horizontal: -4, vertical: -4),
                          leading: const Icon(Iconsax.call, size: 20),
                          title: Text(
                              controller.currentLocationAddress.value?.phone ??
                                  "",
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      ),
                      Obx(
                        () => ListTile(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          visualDensity:
                              const VisualDensity(horizontal: -4, vertical: -4),
                          leading: const Icon(Iconsax.location, size: 20),
                          title: Text(
                              "${controller.currentLocationAddress.value?.fullAddress ?? ""}, ${controller.currentLocationAddress.value?.city ?? ""}, ${controller.currentLocationAddress.value?.nearby ?? ""}, ${controller.currentLocationAddress.value?.zipCode ?? ""}, ${controller.currentLocationAddress.value?.state ?? ""}, ${controller.currentLocationAddress.value?.country ?? ""}.",
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
              CustomElevatedButton(
                text: "Checkout",
                onClick: controller.onCheckout,
                width: getWidth(context),
                style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: CustomColors.TRANSPARENT)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
