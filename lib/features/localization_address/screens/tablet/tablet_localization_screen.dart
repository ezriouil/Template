import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/features/localization_address/localization_address_controller.dart';
import 'package:test1/features/localization_address/widgets/custom_address_card.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/responsive/responsive.dart';

class TabletLocalizationScreen extends Responsive {
  const TabletLocalizationScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final LocalizationAddressController controller =
        Get.put(LocalizationAddressController());
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
          body: ListView.builder(
              itemCount: 3,
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index) =>
                  const CustomAddressCard()),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.onNavigateToInsertAddressScreen(DeviceType.TABLE);
          },
          backgroundColor: primaryColor(context),
          child: const Icon(Iconsax.add, color: CustomColors.WHITE),
        ));
  }
}
