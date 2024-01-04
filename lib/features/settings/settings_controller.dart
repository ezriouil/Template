import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test1/features/account_privacy/screens/mobile_account_privacy_screen.dart';
import 'package:test1/features/cart/screens/mobile_cart_screen.dart';
import 'package:test1/features/location_address/screens/mobile/mobile_location_screen.dart';
import 'package:test1/features/notification/screens/mobile_notification_screen.dart';
import 'package:test1/features/notification/screens/tablet_notification_screen.dart';
import 'package:test1/features/notification/screens/web_notification_screen.dart';
import 'package:test1/features/product/screens/web_product_screen.dart';
import 'package:test1/features/profile/screens/mobile_profile_screen.dart';
import 'package:test1/features/profile/screens/tablet_profile_screen.dart';
import 'package:test1/features/track/screens/mobile_track_order_screen.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/theme/theme_app.dart';

class SettingsController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //

  late final RxBool accountPrivacy,
      theme,
      hdImagesQuality,
      upgradeUi,
      showFloatingActionButton;
  late final RxString profileImgUrl, fullName, email;

  late final GetStorage _storage;
  late final ScrollController scrollController;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //

  @override
  void onInit() {
    super.onInit();
    _storage = GetStorage();
    accountPrivacy = true.obs;
    hdImagesQuality = true.obs;
    upgradeUi = true.obs;
    theme = false.obs;
    profileImgUrl = "".obs;
    fullName = "".obs;
    email = "".obs;
    scrollController = ScrollController();
    showFloatingActionButton = false.obs;
    manageScrollController();
  }

  // - - - - - - - - - - - - - - - - - - SCROLL CONTROLLER - - - - - - - - - - - - - - - - - -  //
  manageScrollController() async {
    scrollController.addListener(() {
      double showOffset = 5.0;
      if (scrollController.offset > showOffset) {
        showFloatingActionButton.value = true;
      } else {
        showFloatingActionButton.value = false;
      }
    });
    _storage.read("ENABLE_DARK_MODE") ?? false == true ? theme.value = true : theme.value = false;
  }

  // - - - - - - - - - - - - - - - - - - NAVIGATION TO PROFILE SCREEN - - - - - - - - - - - - - - - - - -  //
  navigateToProfileScreen({required DeviceType deviceType}) {
    switch (deviceType) {
      case DeviceType.MOBILE:
        Get.to(() => const MobileProfileScreen());
      case DeviceType.TABLE:
        Get.to(() => const TabletProfileScreen());
      case DeviceType.WEB:
        Get.to(() => const WebProductScreen());
    }
  }

  // - - - - - - - - - - - - - - - - - - NAVIGATION TO ADDRESS SCREEN - - - - - - - - - - - - - - - - - -  //
  navigateToAddressesScreen({required DeviceType deviceType}) {
    switch (deviceType) {
      case DeviceType.MOBILE:
        Get.off(() => const MobileLocationScreen());
      case DeviceType.TABLE:
        Get.to(() => const TabletProfileScreen());
      case DeviceType.WEB:
        Get.to(() => const WebProductScreen());
    }
  }

  // - - - - - - - - - - - - - - - - - - NAVIGATION TO CART SCREEN - - - - - - - - - - - - - - - - - -  //
  navigateToCartScreen({required DeviceType deviceType}) {
    switch (deviceType) {
      case DeviceType.MOBILE:
        Get.to(() => const MobileCartScreen());
      case DeviceType.TABLE:
        Get.to(() => const TabletProfileScreen());
      case DeviceType.WEB:
        Get.to(() => const WebProductScreen());
    }
  }

  // - - - - - - - - - - - - - - - - - - NAVIGATION TO ORDERS SCREEN - - - - - - - - - - - - - - - - - -  //
  navigateToOrdersScreen({required DeviceType deviceType}) {
    switch (deviceType) {
      case DeviceType.MOBILE:
        Get.to(() => const MobileTrackOrderScreen());
      case DeviceType.TABLE:
        Get.to(() => const TabletProfileScreen());
      case DeviceType.WEB:
        Get.to(() => const WebProductScreen());
    }
  }

  // - - - - - - - - - - - - - - - - - - NAVIGATION TO COUPON SCREEN - - - - - - - - - - - - - - - - - -  //
  navigateToCouponScreen({required DeviceType deviceType}) {
    switch (deviceType) {
      case DeviceType.MOBILE:
        Get.to(() => const MobileProfileScreen());
      case DeviceType.TABLE:
        Get.to(() => const TabletProfileScreen());
      case DeviceType.WEB:
        Get.to(() => const WebProductScreen());
    }
  }

  // - - - - - - - - - - - - - - - - - - NAVIGATION TO NOTIFICATION SCREEN - - - - - - - - - - - - - - - - - -  //
  navigateToNotificationScreen({required DeviceType deviceType}) {
    switch (deviceType) {
      case DeviceType.MOBILE:
        Get.to(() => const MobileNotificationScreen());
      case DeviceType.TABLE:
        Get.to(() => const TabletNotificationScreen());
      case DeviceType.WEB:
        Get.to(() => const WebNotificationScreen());
    }
  }

  // - - - - - - - - - - - - - - - - - - NAVIGATION TO ACCOUNT PRIVACY SCREEN - - - - - - - - - - - - - - - - - -  //
  navigateToAccountPrivacyScreen({required DeviceType deviceType}) {
    switch (deviceType) {
      case DeviceType.MOBILE:
        Get.to(() => const MobileAccountPrivacyScreen());
      case DeviceType.TABLE:
        Get.to(() => const TabletProfileScreen());
      case DeviceType.WEB:
        Get.to(() => const WebProductScreen());
    }
  }

  // - - - - - - - - - - - - - - - - - - LOGOUT BUTTON - - - - - - - - - - - - - - - - - -  //
  logout() {}

  // - - - - - - - - - - - - - - - - - - UPDATE ACCOUNT PRIVACY SWITCH BUTTON - - - - - - - - - - - - - - - - - -  //
  onUpdateCurrentAccountPrivacy(bool switched) {
    accountPrivacy.value = switched;
  }

  // - - - - - - - - - - - - - - - - - - UPDATE THE APP SWITCH BUTTON - - - - - - - - - - - - - - - - - -  //
  onUpdateThemeApp(bool switched) {
    theme.value = switched;
    if(theme.isTrue){
      Get.changeTheme(ThemeApp.darkTheme);
      _storage.write("ENABLE_DARK_MODE", true);
    }else{
      Get.changeTheme(ThemeApp.lightTheme);
      _storage.write("ENABLE_DARK_MODE", false);
    }
  }

  // - - - - - - - - - - - - - - - - - - UPDATE HD IMAGES QUALITY SWITCH BUTTON - - - - - - - - - - - - - - - - - -  //
  onUpdateCurrentHDImagesQuality(bool switched) {
    hdImagesQuality.value = switched;
  }

  // - - - - - - - - - - - - - - - - - - UPDATE UPGRADE UI SWITCH BUTTON - - - - - - - - - - - - - - - - - -  //
  onUpdateCurrentUpdateUi(bool switched) {
    upgradeUi.value = switched;
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    accountPrivacy.close();
    hdImagesQuality.close();
    upgradeUi.close();
    profileImgUrl.close();
    fullName.close();
    email.close();
  }
}
