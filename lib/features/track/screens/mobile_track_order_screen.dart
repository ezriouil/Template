import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/data/models/location_address.dart';
import 'package:test1/data/models/order.dart';
import 'package:test1/features/track/widgets/custom_order_track.dart';
import 'package:test1/utils/responsive/responsive.dart';

class MobileTrackOrderScreen extends Responsive {
  const MobileTrackOrderScreen({
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
                ?.copyWith(color: darkLightColor(context))),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Iconsax.arrow_left_24,
            color: darkLightColor(context),
          ),
        ),
      ),
      body:ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomOrderTrack(
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
                        phone: "0611223344"))),
          )),
    );
  }
}
