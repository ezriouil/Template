import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/features/auth/forget_password/forget_password_controller.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/responsive/responsive.dart';

class TabletForgetPassword extends Responsive {
  const TabletForgetPassword({super.key});

  @override
  Widget execute(BuildContext context) {
    // - - - - - - - - - - - - - - - - - - INSTANCE FROM THE CONTROLLER - - - - - - - - - - - - - - - - - -  //
    final ForgetPasswordController controller =
        Get.put(ForgetPasswordController());
    controller.deviceType = DeviceType.TABLE;
    return const Placeholder();
  }
}
