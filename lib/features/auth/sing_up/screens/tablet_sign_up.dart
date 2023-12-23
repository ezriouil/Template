import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/features/auth/sing_up/sing_up_controller.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/responsive/responsive.dart';

class TabletSignUp extends Responsive {
  const TabletSignUp({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - - - - - - - - - - - - INSTANCE FROM THE CONTROLLER - - - - - - - - - - - - - - - - - -  //
    final SignUpController controller = Get.put(SignUpController());
    controller.deviceType = DeviceType.TABLE;

    return const Placeholder();
  }
}
