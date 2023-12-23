import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/features/auth/sing_up/sing_up_controller.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/responsive/responsive.dart';

class WebSignUp extends Responsive {
  const WebSignUp({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - - - - - - - - - - - - INSTANCE FROM THE CONTROLLER - - - - - - - - - - - - - - - - - -  //
    final SignUpController controller = Get.put(SignUpController());
    controller.deviceType = DeviceType.WEB;

    return const Placeholder();
  }
}
