import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/features/location_address/location_address_controller.dart';
import 'package:test1/utils/responsive/responsive.dart';

class TabletAddNewLocationAddressScreen extends Responsive {
  const TabletAddNewLocationAddressScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final LocationAddressController controller = Get.put(LocationAddressController());
    return const Placeholder();
  }
}
