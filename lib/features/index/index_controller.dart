import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test1/features/home/screens/mobile_home_screen.dart';
import 'package:test1/features/home/screens/tablet_home_screen.dart';
import 'package:test1/features/settings/screens/mobile_settings_screen.dart';
import 'package:test1/features/settings/screens/tablet_settings_screen.dart';
import 'package:test1/features/store/screens/mobile_store_screen.dart';
import 'package:test1/features/store/screens/tablet_store_screen.dart';
import 'package:test1/features/wish_list/screens/mobile_wish_list_screen.dart';
import 'package:test1/features/wish_list/screens/tablet_wish_list_screen.dart';
import 'package:test1/utils/device/device_utility.dart';

class IndexController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  static late final RxInt currentIndex;
  late DeviceType deviceType;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    currentIndex = 0.obs;
    super.onInit();
  }

  // - - - - - - - - - - - - - - - - - - UPDATE CURRENT INDEX - - - - - - - - - - - - - - - - - -  //
  onUpdateCurrentIndex(int index) {
    currentIndex.value = index;
  }

  // - - - - - - - - - - - - - - - - - - SCREENS - - - - - - - - - - - - - - - - - -  //
  List<Widget> screens(){
   return switch(deviceType){

      DeviceType.MOBILE => [
        const MobileHomeScreen(),
        const MobileStoreScreen(),
        const MobileWishListScreen(),
        const MobileSettingsScreen(),
      ],

      DeviceType.TABLE => [
        const TabletHomeScreen(),
        const TabletStoreScreen(),
        const TabletWishListScreen(),
        const TabletSettingsScreen(),
      ],
      DeviceType.WEB => [

      ],
    };
  }
}