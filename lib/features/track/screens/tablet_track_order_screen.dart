import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_grid_view.dart';
import 'package:test1/data/models/location_address.dart';
import 'package:test1/data/models/order.dart';
import 'package:test1/features/track/widgets/custom_order_track.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class TabletTrackOrderScreen extends Responsive {
  const TabletTrackOrderScreen({
    super.key,
  });

  @override
  Widget execute(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: darkDarkLightLightColor(context),
          title: Text("Track orders",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontSize: 40, color: darkLightColor(context))),
          leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(
              Iconsax.arrow_left_24,
              size: 40,
              color: darkLightColor(context),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS/2),
          child: CustomGridView(
              count: 6,
              spaceBetweenColumns: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
              itemBuilder: (BuildContext context, int index) => CustomOrderTrack(
                  order: Order(
                      id: 0,
                      orderPrice: 300,
                      date: "Time : Mon 1 Jan 18:26",
                      orderState: "WAITING",
                      order: "Jacket sport noir x2",
                      locationAddress: LocationAddress(
                          fullName: "Mohamed ezriouil",
                          fullAddress: "Hay salam G10 N100",
                          nearby: "lhanout",
                          city: "Agadir",
                          state: "Rabat-sale-knitra",
                          zipCode: "80000",
                          phone: "0611223344")))),
        ));
  }
}
