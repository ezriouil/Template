import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_animation_screen.dart';
import 'package:test1/common/widgets/custom_snackbars.dart';
import 'package:test1/data/repositories/auth_repositories/reset_the_password_repository.dart';
import 'package:test1/features/auth/login/screens/mobile_login_screen.dart';
import 'package:test1/features/auth/login/screens/tablet_login_screen.dart';
import 'package:test1/features/auth/login/screens/web_login_screen.dart';
import 'package:test1/utils/constants/custom_animations_strings.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/helpers/network.dart';

class ForgetPasswordController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //

  late final TextEditingController emailController;
  late final GlobalKey<FormState> formState;
  late DeviceType deviceType;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    formState = GlobalKey<FormState>();
  }

// - - - - - - - - - - - - - - - - - - SEND TO EMAIL - - - - - - - - - - - - - - - - - -  //
  void sendToEmail() async {
    try {
      /// CHECK THE NETWORK
      final hasNetwork = await _checkTheNetwork();
      if (!hasNetwork) return;

      /// CHECK FROM VALIDATION
      if (!formState.currentState!.validate()) return;

      /// START LOADER
      Get.to(
          const CustomAnimationScreen(text: "We are processing your info ..."));
      await Future.delayed(const Duration(milliseconds: 500));

      /// SEND TO EMAIL
      bool sentSuccessfully = await ResetThePasswordRepository.resetThePassword(
          email: emailController.text);
      if (!sentSuccessfully) {
        await Future.delayed(const Duration(milliseconds: 500));
        Get.back();
        await Future.delayed(const Duration(milliseconds: 500));

        /// SHOW THE ERROR SNACK BAR
        CustomSnackBars.error(
            title: "We can't send you message to your email!",
            message: "please check your email address and try again.");
        return;
      }

      /// STOP THE LOADER
      Get.back();
      await Future.delayed(const Duration(milliseconds: 500));

      /// SHOW SUCCESS MESSAGE
      Get.off(
        CustomAnimationScreen(
          lottieAnime: CustomAnimationStrings.GMAIL,
          animationHeight: 0.3,
          text: "Password Reset Email Sent!",
          description:
              "${emailController.text}\n\nYour account security is our priority we're sent a secure link to safety change your password and keep your account protected.",
          actionText: "Done",
          onActionClick: () {
            switch (deviceType) {
              case DeviceType.MOBILE:
                Get.offAll(() => const MobileLoginScreen());
              case DeviceType.TABLE:
                Get.offAll(() => const TabletLoginScreen());
              case DeviceType.WEB:
                Get.offAll(() => const WebLoginScreen());
            }
          },
          secondActionText: "Resend Email",
          onSecondActionClick: () {
            CustomSnackBars.success(
                title: "Go to your email and check the message", message: "");
          },
        ),
      );
    } catch (_) {
      /// STOP THE LOADER
      await Future.delayed(const Duration(milliseconds: 500));
      Get.back();
      await Future.delayed(const Duration(milliseconds: 500));

      /// SHOW THE ERROR SNACK BAR
      CustomSnackBars.error(
          title: "Error 404", message: "please try again next time!");
    }
  }

  // - - - - - - - - - - - - - - - - - - CHECK THE NETWORK - - - - - - - - - - - - - - - - - -  //
  Future<bool> _checkTheNetwork() async {
    final hasNetwork = await Network.hasConnection();
    if (!hasNetwork) {
      CustomSnackBars.error(
          icon: Iconsax.wifi,
          title: "No internet connection",
          message: "please check your network device.");
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    formState.currentState?.dispose();
  }
}
