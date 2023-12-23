import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test1/features/onboarding/onboarding_controller.dart';
import 'package:test1/features/onboarding/widgets/custom_onboarding_page.dart';
import 'package:test1/utils/constants/custom_animations_strings.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/responsive/responsive.dart';

class TabletOnboardingScreen extends Responsive {
  const TabletOnboardingScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final OnBoardingController controller = Get.put(OnBoardingController());
    return Stack(
      children: [
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.onUpdatePageIndicator,
          children: const [
            CustomOnboardingPage(
              title: CustomTextStrings.ONBOARDING_TITLE_1,
              subTitle:
              CustomTextStrings.ONBOARDING_SUB_TITLE_1,
              animation: CustomAnimationStrings.ONBOARDING_SHOPPING,
            ),
            CustomOnboardingPage(
              title: CustomTextStrings.ONBOARDING_TITLE_2,
              subTitle:
              CustomTextStrings.ONBOARDING_SUB_TITLE_2,
              animation:
              CustomAnimationStrings.ONBOARDING_FASE_DELIVERY_SHIPPING,
            ),
            CustomOnboardingPage(
              title: CustomTextStrings.ONBOARDING_TITLE_3,
              subTitle:CustomTextStrings.ONBOARDING_SUB_TITLE_3,
              animation:
              CustomAnimationStrings.ONBOARDING_ONLINE_DELIVERY_SERVICE,
            ),
          ],
        ),
        Positioned(
            right: getWidth(context) * 0.1,
            top: getHeight(context) * 0.1,
            child: OutlinedButton(
                onPressed: controller.onSkip,
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    side: const BorderSide(style: BorderStyle.none)),
                child: Text(CustomTextStrings.ONBOARDING_SKIP,
                    style: Theme.of(context).textTheme.titleMedium))),
        Positioned(
          bottom: getHeight(context) * 0.075,
          left: getWidth(context) * 0.1,
          child: SmoothPageIndicator(
            count: controller.lastPageNbr + 1,
            controller: controller.pageController,
            effect: ExpandingDotsEffect(
                dotHeight: 4.0,
                dotColor: grayColor(context),
                activeDotColor: darkLightColor(context)),
          ),
        ),
        Positioned(
          bottom: getHeight(context) * 0.025,
          right: getWidth(context) * 0.1,
          child: OutlinedButton(
              onPressed: () {
                controller.onNextPage(deviceType: DeviceType.TABLE);
              },
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.zero, side: const BorderSide(width: 2.0)),
              child: const Icon(Icons.keyboard_arrow_right, size: 50.0)),
        ),
      ],
    );
  }
}
