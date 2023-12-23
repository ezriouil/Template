import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_animation_screen.dart';
import 'package:test1/common/widgets/custom_snackbars.dart';
import 'package:test1/data/repositories/auth_repository/sign_up_repository.dart';
import 'package:test1/features/auth/common/soical_media_auth.dart';
import 'package:test1/features/auth/login/screens/mobile_login_screen.dart';
import 'package:test1/features/auth/login/screens/tablet_login_screen.dart';
import 'package:test1/features/auth/login/screens/web_login_screen.dart';
import 'package:test1/utils/constants/custom_animations_strings.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/helpers/network.dart';

class SignUpController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //

  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController userNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController passwordController;

  late final UserCredential? _userCredential;
  late final GlobalKey<FormState> formState;
  late final RxBool checkbox;
  late final RxBool passwordObscure;
  late DeviceType deviceType;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //

  @override
  void onInit() {
    super.onInit();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    checkbox = true.obs;
    passwordObscure = true.obs;
    formState = GlobalKey<FormState>();
  }

  // - - - - - - - - - - - - - - - - - - CREATE ACCOUNT BY EMAIL AND PASSWORD - - - - - - - - - - - - - - - - - -  //

  Future<void> onCreateAccount() async {
    try {
      /// CHECK THE NETWORK
      final bool hasNetwork = await _checkTheNetwork();
      if (!hasNetwork) return;

      /// CHECK FROM VALIDATION
      if (!formState.currentState!.validate()) return;

      /// START LOADER
      Get.to(
          const CustomAnimationScreen(text: "We are processing your info ..."));
      await Future.delayed(const Duration(milliseconds: 500));

      /// CREATE ACCOUNT WITH EMAIL AND PASSWORD
      _userCredential = await SignUpRepository.signUpWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (_userCredential == null) {
        await Future.delayed(const Duration(milliseconds: 500));
        Get.back();
        await Future.delayed(const Duration(milliseconds: 500));

        /// SHOW THE ERROR SNACK BAR
        CustomSnackBars.error(
            title: "Email already used before !!", message: "");
        await Future.delayed(const Duration(milliseconds: 500));
        return;
      }

      /// SAVE DATA TO DATABASE

      /// SAVE EMAIL AND PASSWORD INTO LOCAL STORAGE

      /// STOP THE LOADER
      Get.back();
      await Future.delayed(const Duration(milliseconds: 500));

      /// NAVIGATE TO LOGIN SCREEN
      _toLoginScreen();
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

  // - - - - - - - - - - - - - - - - - - SING UP WITH GOOGLE - - - - - - - - - - - - - - - - - -  //
  void onSingUpWithGoogle() async {
    try {
      /// CHECK THE NETWORK
      final bool hasNetwork = await _checkTheNetwork();
      if (!hasNetwork) return;

      /// START LOADER
      Get.to(
          const CustomAnimationScreen(text: "We are processing your info ..."));
      await Future.delayed(const Duration(milliseconds: 500));

      _userCredential = await SocialMediaAuth.onAuthWithGoogle();
      if (_userCredential == null) {
        await Future.delayed(const Duration(milliseconds: 500));
        Get.back();
        await Future.delayed(const Duration(milliseconds: 500));

        /// SHOW THE ERROR SNACK BAR
        CustomSnackBars.error(title: "Error Undefined", message: "");
        await Future.delayed(const Duration(milliseconds: 500));
        return;
      }

      /// SAVE DATA TO DATABASE

      /// STOP THE LOADER
      Get.back();
      await Future.delayed(const Duration(milliseconds: 500));

      /// NAVIGATE TO LOGIN SCREEN
      _toLoginScreen();
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

  // - - - - - - - - - - - - - - - - - - SING UP WITH FACEBOOK - - - - - - - - - - - - - - - - - -  //
  void onSingUpWithFacebook() async {
    try {
      /// CHECK THE NETWORK
      final bool hasNetwork = await _checkTheNetwork();
      if (!hasNetwork) return;

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

      /// SAVE DATA TO DATABASE

      /// STOP THE LOADER
      Get.back();
      await Future.delayed(const Duration(milliseconds: 500));

      /// NAVIGATE TO LOGIN SCREEN
      _toLoginScreen();
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

  // - - - - - - - - - - - - - - - - - - NAVIGATE TO LOGIN SCREEN - - - - - - - - - - - - - - - - - -  //
  void _toLoginScreen() {
    Get.offAll(CustomAnimationScreen(
      lottieAnime: CustomAnimationStrings.SUCCESSFULLY,
      animationHeight: 0.7,
      text: "Your account successfully created!",
      description:
          "Welcome to your Ultimate Shopping Destination\nYour account is CreatedUnleash the joy at Seamless\nOnline Shopping!",
      actionText: "Continue",
      onActionClick: () {
        switch (deviceType) {
          case DeviceType.MOBILE:
            Get.to(()=>const MobileLoginScreen());
          case DeviceType.TABLE:
            Get.to(()=>const TabletLoginScreen());
          case DeviceType.WEB:
            Get.to(()=>const WebLoginScreen());
        }
      },
    ));
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
    firstNameController.dispose();
    lastNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    _userCredential = null;
    formState.currentState?.dispose();
    checkbox.close();
    passwordObscure.close();
  }
}
