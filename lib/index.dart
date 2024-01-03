import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/features/home/screens/mobile_home_screen.dart';
import 'package:test1/features/settings/screens/mobile_settings_screen.dart';
import 'package:test1/features/store/screens/mobile_store_screen.dart';
import 'package:test1/features/wish_list/screens/mobile_wish_list_screen.dart';
import 'package:test1/utils/responsive/responsive.dart';

class Index extends Responsive {
  const Index({super.key});

  @override
  Widget execute(BuildContext context) {
    final IndexController controller = Get.put(IndexController());
    return Scaffold(
      body: Obx(() => controller.screens[IndexController.currentIndex.value]),
      bottomNavigationBar: Obx(
        () =>NavigationBar(
          height: 70.0,
          elevation: 0.0,
          selectedIndex: IndexController.currentIndex.value,
          onDestinationSelected: controller.onUpdateCurrentIndex,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
            NavigationDestination(icon: Icon(Iconsax.heart), label: "Wishlist"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Profile")
          ],
        ),
      ),
    );
  }
}

class IndexController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  static late final RxInt currentIndex;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    currentIndex = 0.obs;
  }

  // - - - - - - - - - - - - - - - - - - UPDATE CURRENT INDEX - - - - - - - - - - - - - - - - - -  //
   onUpdateCurrentIndex(int index) {
    currentIndex.value = index;
  }

  // - - - - - - - - - - - - - - - - - - SCREENS - - - - - - - - - - - - - - - - - -  //
  final screens = const [
    MobileHomeScreen(),
    MobileStoreScreen(),
    MobileWishListScreen(),
    MobileSettingsScreen(),
  ];
}
