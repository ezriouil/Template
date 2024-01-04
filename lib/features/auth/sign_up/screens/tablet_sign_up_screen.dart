import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/features/auth/sign_up/sign_up_controller.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/responsive/responsive.dart';

class TabletSignUpScreen extends Responsive {
  const TabletSignUpScreen({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - - - - - - - - - - - - INSTANCE FROM THE CONTROLLER - - - - - - - - - - - - - - - - - -  //
    final SignUpController controller = Get.put(SignUpController());
    controller.deviceType = DeviceType.TABLE;

    return const Placeholder();
  }
}
