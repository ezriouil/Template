import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/features/index/index_controller.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/responsive/responsive.dart';

class MobileIndexScreen extends Responsive {
  const MobileIndexScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final IndexController controller = Get.put(IndexController());
    controller.deviceType = DeviceType.MOBILE;
    return Scaffold(
      body: Obx(() => controller.screens()[IndexController.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 70.0,
          elevation: 0.0,
          animationDuration: const Duration(seconds: 3),
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
