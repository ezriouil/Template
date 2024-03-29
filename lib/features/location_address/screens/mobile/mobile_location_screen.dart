import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/features/location_address/location_address_controller.dart';
import 'package:test1/features/location_address/widgets/custom_address_tile.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/responsive/responsive.dart';

class MobileLocationScreen extends Responsive {
  const MobileLocationScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final LocationAddressController controller =
        Get.put(LocationAddressController());
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text("Addresses"),
                leading: InkWell(
                  onTap: () => Get.back(),
                  child: Icon(
                    Iconsax.arrow_left_24,
                    color: darkLightColor(context),
                  ),
                ),
              )
            ];
          },
          body: Obx(()=>ListView.builder(
                itemCount: controller.locationAddresses.length,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) =>
                    CustomAddressTile(
                        onDelete: () {},
                        address: controller.locationAddresses[index])),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.onNavigateToInsertAddressScreen(DeviceType.MOBILE);
          },
          backgroundColor: primaryColor(context),
          child: const Icon(Iconsax.add, color: CustomColors.WHITE),
        ));
  }
}
