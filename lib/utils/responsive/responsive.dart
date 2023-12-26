import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/device/device_utility.dart';

abstract class Responsive extends StatelessWidget {
  const Responsive({super.key});

  @override
  Widget build(BuildContext context) {
    isDark(context);
    darkLightColor(context);
    primaryColor(context);
    isMobile(context);
    isTablet(context);
    return execute(context);
  }

  /// BUILD METHODE
  Widget execute(BuildContext context);

  /// INFO
  double getWidth(BuildContext context) =>
      DeviceUtility.getDeviceWidth(context);

  double getHeight(BuildContext context) =>
      DeviceUtility.getDeviceHeight(context);

  bool isDark(BuildContext context) => DeviceUtility.isDark(context);

  Color grayColor(BuildContext context) {
    return isDark(context) ? CustomColors.GREY_DARK : CustomColors.GREY_LIGHT;
  }

  Color darkLightColor(BuildContext context) {
    return isDark(context) ? CustomColors.WHITE : CustomColors.BLACK;
  }

  Color darkDarkLightLightColor(BuildContext context) {
    return isDark(context) ? CustomColors.BLACK : CustomColors.WHITE;
  }

  Color yellowColor(BuildContext context) {
    return isDark(context) ? CustomColors.YELLOW_DARK : CustomColors.YELLOW_LIGHT;
  }

  Color primaryColor(BuildContext context) {
    return isDark(context)
        ? CustomColors.PRIMARY_LIGHT
        : CustomColors.PRIMARY_DARK;
  }

  bool isTablet(BuildContext context) {
    return context.isTablet;
  }

  bool isMobile(BuildContext context) {
    return context.isPhone;
  }
}
