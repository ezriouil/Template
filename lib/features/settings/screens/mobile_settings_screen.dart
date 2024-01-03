import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_outlined_button.dart';
import 'package:test1/common/widgets/custom_settings_tile.dart';
import 'package:test1/features/settings/settings_controller.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/responsive/responsive.dart';

class MobileSettingsScreen extends Responsive {
  const MobileSettingsScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    // - - - - - - - - - - - - - - - - - - INJECT THE CONTROLLER DEPENDENCE - - - - - - - - - - - - - - - - - -  //
    final SettingsController controller = Get.put(SettingsController());

    // - - - - - - - - - - - - - - - - - - CONSTANT REUSABLE- - - - - - - - - - - - - - - - - -  //
    const radius12 = Radius.circular(12.0);

    // - - - - - - - - - - - - - - - - - - SCAFFOLD - - - - - - - - - - - - - - - - - -  //
    return Scaffold(
      body: NestedScrollView(
        controller: controller.scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            // - - - - - - - - - - - - - - - - - - APP BAR - - - - - - - - - - - - - - - - - -  //
            SliverAppBar(
                title: Text("Account",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: CustomColors.WHITE)),
                automaticallyImplyLeading: false,
                centerTitle: false,
                backgroundColor: primaryColor(context))
          ];
        },

        // - - - - - - - - - - - - - - - - - - BODY - - - - - - - - - - - - - - - - - -  //
        body: SingleChildScrollView(
          child: Container(
            color: primaryColor(context),
            width: getWidth(context),
            child: Column(
              children: [
                // - - - - - - - - - - - - - - - - - - IMG + TITLE + EMAIL + ICON - - - - - - - - - - - - - - - - - -  //
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                      horizontal: CustomSizes.SPACE_BETWEEN_ITEMS / 1.5),
                  child: CustomSettingTile(
                    imgUrl:
                        "https://avatars.githubusercontent.com/u/130238246?s=400&u=da527d8650bf8833bf66c213e70d09b8aaa025b7&v=4",
                    title: "Mohamed ezriouil",
                    titleStyle: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: CustomColors.WHITE),
                    subTitle: "Mohamedezriouil@gmail.com",
                    subTitleStyle: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: CustomColors.WHITE),
                    trailing:
                        const Icon(Iconsax.edit, color: CustomColors.WHITE),
                    onClick: () => controller.navigateToProfileScreen(
                        deviceType: DeviceType.MOBILE),
                  ),
                ),

                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                // - - - - - - - - - - - - - - - - - - TILES SECTION - - - - - - - - - - - - - - - - - -  //
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
                      // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                      const SizedBox(
                          height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                      // - - - - - - - - - - - - - - - - - - ACCOUNT SETTINGS TITLE - - - - - - - - - - - - - - - - - -  //
                      Text("Account Settings",
                          style: Theme.of(context).textTheme.titleLarge),

                      // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                      const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                      // - - - - - - - - - - - - - - - - - - ADDRESS TILE - - - - - - - - - - - - - - - - - -  //
                      CustomSettingTile(
                        icon: Iconsax.safe_home,
                        title: "My Addresses",
                        subTitle: "Set shopping delivery address",
                        onClick: () => controller.navigateToAddressesScreen(
                            deviceType: DeviceType.MOBILE),
                      ),

                      // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                      const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                      // - - - - - - - - - - - - - - - - - - ADDRESS TILE - - - - - - - - - - - - - - - - - -  //
                      CustomSettingTile(
                        icon: Iconsax.shopping_cart,
                        title: "My Cart",
                        subTitle: "Add, remove products and move to checkout",
                        onClick: () => controller.navigateToCartScreen(
                            deviceType: DeviceType.MOBILE),
                      ),

                      // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                      const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                      // - - - - - - - - - - - - - - - - - - ADDRESS TILE - - - - - - - - - - - - - - - - - -  //
                      CustomSettingTile(
                        icon: Iconsax.box,
                        title: "My Orders",
                        subTitle: "In progress and completed orders",
                        onClick: () => controller.navigateToOrdersScreen(
                            deviceType: DeviceType.MOBILE),
                      ),

                      // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                      const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                      // - - - - - - - - - - - - - - - - - - COUPON TILE - - - - - - - - - - - - - - - - - -  //
                      CustomSettingTile(
                        icon: Iconsax.ticket_discount,
                        title: "My Coupons",
                        subTitle: "List of all discounts coupons",
                        onClick: () => controller.navigateToCouponScreen(
                            deviceType: DeviceType.MOBILE),
                      ),

                      // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                      const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                      // - - - - - - - - - - - - - - - - - - NOTIFICATION TILE - - - - - - - - - - - - - - - - - -  //
                      CustomSettingTile(
                        icon: Iconsax.notification,
                        title: "Notifications",
                        subTitle: "Set any kind of notification message",
                        onClick: () => controller.navigateToNotificationScreen(
                            deviceType: DeviceType.MOBILE),
                      ),

                      // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                      const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                      // - - - - - - - - - - - - - - - - - - ACCOUNT PRIVACY TILE - - - - - - - - - - - - - - - - - -  //
                      CustomSettingTile(
                        icon: Iconsax.security_card,
                        title: "Account Privacy",
                        subTitle: "Mango data usage and connected account",
                        onClick: () =>
                            controller.navigateToAccountPrivacyScreen(
                                deviceType: DeviceType.MOBILE),
                      ),

                      // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                      const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                      // - - - - - - - - - - - - - - - - - - ACCOUNT SETTINGS TITLE - - - - - - - - - - - - - - - - - -  //
                      Text("App Settings",
                          style: Theme.of(context).textTheme.titleLarge),

                      // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                      const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                      // - - - - - - - - - - - - - - - - - - ACCOUNT PRIVACY TILE - - - - - - - - - - - - - - - - - -  //
                      Obx(
                        () => CustomSettingTile(
                          icon: Iconsax.security_safe,
                          title: "Account Privacy",
                          subTitle: "Mango data usage and connected account",
                          trailing: Switch(
                              value: controller.accountPrivacy.value,
                              onChanged:
                                  controller.onUpdateCurrentAccountPrivacy),
                          onClick: () => controller.navigateToProfileScreen(
                              deviceType: DeviceType.MOBILE),
                        ),
                      ),

                      // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                      const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                      // - - - - - - - - - - - - - - - - - - HD IMAGE QUALITY TILE - - - - - - - - - - - - - - - - - -  //
                      Obx(
                        () => CustomSettingTile(
                          icon: Iconsax.image,
                          title: "HD Images Quality",
                          subTitle: "Set image quality to be seen",
                          trailing: Switch(
                              value: controller.hdImagesQuality.value,
                              onChanged:
                                  controller.onUpdateCurrentHDImagesQuality),
                          onClick: () => controller.navigateToProfileScreen(
                              deviceType: DeviceType.MOBILE),
                        ),
                      ),

                      // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                      const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                      // - - - - - - - - - - - - - - - - - - UPGRADE UI TILE - - - - - - - - - - - - - - - - - -  //
                      Obx(
                        () => CustomSettingTile(
                          icon: Iconsax.global,
                          title: "Upgrade UI",
                          subTitle: "Set it true to see new ui",
                          trailing: Switch(
                              value: controller.upgradeUi.value,
                              onChanged: controller.onUpdateCurrentUpdateUi),
                          onClick: () => controller.navigateToProfileScreen(
                              deviceType: DeviceType.MOBILE),
                        ),
                      ),

                      // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                      const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                      // - - - - - - - - - - - - - - - - - - THEME TILE - - - - - - - - - - - - - - - - - -  //
                      Obx(
                        () => CustomSettingTile(
                          icon: Iconsax.colorfilter,
                          title: "Change Theme Color",
                          subTitle: "We have dark and light theme for you",
                          trailing: Switch(
                              value: controller.theme.value,
                              onChanged: controller.onUpdateThemeApp),
                          onClick: () => controller.navigateToProfileScreen(
                              deviceType: DeviceType.MOBILE),
                        ),
                      ),

                      // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                      const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                      // - - - - - - - - - - - - - - - - - - LOGOUT BUTTON - - - - - - - - - - - - - - - - - -  //
                      CustomOutlinedButton(
                          text: "Logout",
                          onClick: controller.logout,
                          width: getWidth(context)),
                    ],
                  ),
                )
              ],
            ),
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
    );
  }
}
