import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/footer/about_us.dart';
import 'package:test1/common/footer/conditions.dart';
import 'package:test1/common/footer/contact_us.dart';
import 'package:test1/common/footer/news_letter.dart';
import 'package:test1/features/auth/login/screens/mobile_login_screen.dart';
import 'package:test1/features/auth/sing_up/screens/mobile_sign_up_screen.dart';
import 'package:test1/features/home/home_controller.dart';
import 'package:test1/features/localization_address/screens/mobile/mobile_location_screen.dart';
import 'package:test1/features/notification/screens/mobile_notification_screen.dart';
import 'package:test1/features/onboarding/screens/mobile_onboarding_screen.dart';
import 'package:test1/features/review/screens/mobile_review_screen.dart';
import 'package:test1/features/wish_list/screens/mobile_wish_list_screen.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_icon_strings.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/responsive/responsive.dart';

class MobileHomeScreen extends Responsive {
  const MobileHomeScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: Drawer(
          child: ListTile(
              leading: Icon(Icons.home_filled, color: darkLightColor(context)),
              title: Text("Home",
                  style: TextStyle(color: darkLightColor(context)))),
        ),
        body: SingleChildScrollView(
        controller: controller.scrollController,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AboutUs(
                    logo: CustomIconStrings.APP_LOGO,
                    description:
                        "The obstetrics and gynaecology clinic inside the vast Singapore General Hospital is unlike any ward in the UK. There are no counters or rows of staff waiting to take patients’ details. Instead, their appointments have already been registered via a mobile phone app and they sign themselves",
                    appName: CustomTextStrings.APP_NAME),
                const SizedBox(height: 16),
                const ContactUs(),
                const SizedBox(height: 16),
                const Conditions(),
                const SizedBox(height: 16),
                const NewsLetter(),
                const SizedBox(height: 16),
                SizedBox(
                  width: getWidth(context),
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const MobileReviewScreen());
                      },
                      child: const Text("Go See Reviews")),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: getWidth(context),
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const MobileSignUpScreen());
                      },
                      child: const Text("Sign up")),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: getWidth(context),
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const MobileLoginScreen());
                      },
                      child: const Text("Login")),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: getWidth(context),
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const MobileLocationScreen());
                      },
                      child: const Text("address location")),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: getWidth(context),
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const MobileOnboardingScreen());
                      },
                      child: const Text("onBoarding")),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: getWidth(context),
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const MobileNotificationScreen());
                      },
                      child: const Text("notifications")),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: getWidth(context),
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const MobileWishListScreen());
                      },
                      child: const Text("wishList")),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      floatingActionButton: Obx(
            () => AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: controller.showFloatingActionButton.value ? 1.0 : 0.0,
          child: FloatingActionButton(
            onPressed: () {
              controller.scrollController.animateTo(0,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.fastOutSlowIn);
            },
            elevation: 16.0,
            backgroundColor: primaryColor(context),
            child: const Icon(Iconsax.arrow_up_24, color: CustomColors.WHITE),
          ),
        ),
      ),
    );
  }
}
