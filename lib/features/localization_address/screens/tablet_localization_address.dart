import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/features/localization_address/localization_address_controller.dart';
import 'package:test1/utils/responsive/responsive.dart';

class TabletLocalizationAddress extends Responsive {
  const TabletLocalizationAddress({super.key});

  @override
  Widget execute(BuildContext context) {
    final LocalizationAddressController controller = Get.put(LocalizationAddressController());
    return const Placeholder();
  }
}
