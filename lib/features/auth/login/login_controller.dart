import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_animation_screen.dart';
import 'package:test1/common/widgets/custom_snackbars.dart';
import 'package:test1/data/repositories/auth_repository/login_repository.dart';
import 'package:test1/features/auth/common/soical_media_auth.dart';
import 'package:test1/features/auth/forget_password/screens/mobile_forget_password.dart';
import 'package:test1/features/auth/forget_password/screens/tablet_forget_password.dart';
import 'package:test1/features/auth/forget_password/screens/web_forget_password.dart';
import 'package:test1/features/auth/sing_up/screens/mobile_sign_up.dart';
import 'package:test1/features/auth/sing_up/screens/tablet_sign_up.dart';
import 'package:test1/features/auth/sing_up/screens/web_sign_up.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/helpers/network.dart';

class LoginController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  late final GlobalKey<FormState> formState;
  late final UserCredential? _userCredential;
  late final RxBool checkbox;
  late final RxBool passwordObscure;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordObscure = true.obs;
    passwordObscure = true.obs;
    formState = GlobalKey<FormState>();
  }

  // - - - - - - - - - - - - - - - - - - LOGIN TO ACCOUNT WITH EMAIL AND PASSWORD - - - - - - - - - - - - - - - - - -  //

  void onLogin() async {
    try {
      /// CHECK THE NETWORK
      final bool hasConnection = await _checkTheNetwork();
      if (!hasConnection) return;

      /// CHECK FROM VALIDATION
      if (!formState.currentState!.validate()) return;

      /// START LOADER
      Get.to(
          const CustomAnimationScreen(text: "We are processing your info ..."));
      await Future.delayed(const Duration(milliseconds: 500));

      /// LOGIN INTO ACCOUNT WITH EMAIL AND PASSWORD
      _userCredential = await LoginRepository.loginWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (_userCredential == null) {
        Get.back();
        await Future.delayed(const Duration(milliseconds: 500));

        /// SHOW THE ERROR SNACK BAR
        CustomSnackBars.error(
            title: "The email or password incorrect!",
            message:
                "if you forget your password click on forget password below.");
        await Future.delayed(const Duration(milliseconds: 500));
        return;
      }

      /// STOP THE LOADER
      Get.back();
      await Future.delayed(const Duration(milliseconds: 500));

      /// NAVIGATE TO HOME SCREEN
      //Get.offAll();
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

  // - - - - - - - - - - - - - - - - - - LOGIN WITH GOOGLE - - - - - - - - - - - - - - - - - -  //
  void onLoginWithGoogle() async {
    try {
      /// CHECK THE NETWORK
      final bool hasConnection = await _checkTheNetwork();
      if (!hasConnection) return;

      /// START LOADER
      Get.to(
          const CustomAnimationScreen(text: "We are processing your info ..."));
      await Future.delayed(const Duration(seconds: 1));

      _userCredential = await SocialMediaAuth.onAuthWithGoogle();
      if (_userCredential == null) {
        await Future.delayed(const Duration(seconds: 1));
        Get.back();
        await Future.delayed(const Duration(milliseconds: 500));

        /// SHOW THE ERROR SNACK BAR
        CustomSnackBars.error(title: "Error Undefined", message: "");
        await Future.delayed(const Duration(milliseconds: 500));
        return;
      }

      /// STOP THE LOADER
      Get.back();
      await Future.delayed(const Duration(milliseconds: 500));

      /// NAVIGATE TO HOME SCREEN
      //Get.offAll(); TO MAIN SCREEN
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

  // - - - - - - - - - - - - - - - - - - LOGIN WITH FACEBOOK - - - - - - - - - - - - - - - - - -  //
  void onLoginWithFacebook() async {
    try {
      /// CHECK THE NETWORK
      final bool hasConnection = await _checkTheNetwork();
      if (!hasConnection) return;

      /// START LOADER
      Get.to(
          const CustomAnimationScreen(text: "We are processing your info ..."));
      await Future.delayed(const Duration(milliseconds: 500));

      _userCredential = await SocialMediaAuth.onAuthWithFacebook();
      if (_userCredential == null) {
        await Future.delayed(const Duration(milliseconds: 500));
        Get.back();
        await Future.delayed(const Duration(milliseconds: 500));

        /// SHOW THE ERROR SNACK BAR
        CustomSnackBars.error(title: "Error Undefined", message: "");
        await Future.delayed(const Duration(milliseconds: 500));
        return;
      }

      /// STOP THE LOADER
      Get.back();
      await Future.delayed(const Duration(milliseconds: 500));

      /// NAVIGATE TO HOME SCREEN
      //Get.offAll();
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

  // - - - - - - - - - - - - - - - - - - GO TO SING UP SCREEN - - - - - - - - - - - - - - - - - -  //

  void onNavigateToSingUpScreen({required DeviceType deviceType}) {
    switch (deviceType) {
      case DeviceType.MOBILE:
        Get.to(() => const MobileSignUp());
      case DeviceType.TABLE:
        Get.to(() => const TabletSignUp());
      case DeviceType.WEB:
        Get.to(() => const WebSignUp());
    }
  }

  // - - - - - - - - - - - - - - - - - - GO TO FORGET PASSWORD SCREEN - - - - - - - - - - - - - - - - - -  //

  void onNavigateToForgetPasswordScreen({required DeviceType deviceType}) {
    switch (deviceType) {
      case DeviceType.MOBILE:
        Get.to(() => const MobileForgetPassword());
      case DeviceType.TABLE:
        Get.to(() => const TabletForgetPassword());
      case DeviceType.WEB:
        Get.to(() => const WebForgetPassword());
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
    emailController.dispose();
    passwordController.dispose();
    _userCredential = null;
    formState.currentState?.dispose();
    passwordObscure.close();
    checkbox.close();
  }
}
