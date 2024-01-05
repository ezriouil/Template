import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_grid_view.dart';
import 'package:test1/features/location_address/location_address_controller.dart';
import 'package:test1/features/location_address/widgets/custom_address_tile.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/responsive/responsive.dart';

class TabletLocationScreen extends Responsive {
  const TabletLocationScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final LocationAddressController controller =
        Get.put(LocationAddressController());
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text("Addresses", style: Theme.of(context).textTheme.headlineMedium),
                leading: InkWell(
                  onTap: () => Get.back(),
                  child: Icon(
                    size: 40,
                    Iconsax.arrow_left_24,
                    color: darkLightColor(context),
                  ),
                ),
              )
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
            child: Obx(()=> CustomGridView(
                  itemsHeight: 150,
                    itemBuilder: (BuildContext context, int index) =>
                        CustomAddressTile(
                            onDelete: () {},
                            address: controller.locationAddresses[index]),
                    count: controller.locationAddresses.length),
            ),
          ),

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
