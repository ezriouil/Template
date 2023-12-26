import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test1/features/auth/login/screens/mobile_login_screen.dart';
import 'package:test1/features/auth/login/screens/tablet_login_screen.dart';
import 'package:test1/features/auth/login/screens/web_login_screen.dart';
import 'package:test1/utils/device/device_utility.dart';

class OnBoardingController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late PageController pageController;
  late final int lastPageNbr;
  late int _currentPageIndex;

  // - - - - - - - - - - - - - - - - - - INIT THE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    lastPageNbr = 2;
    _currentPageIndex = 0;
  }

  // - - - - - - - - - - - - - - - - - - UPDATE PAGE INDEX - - - - - - - - - - - - - - - - - -  //
  void onUpdatePageIndicator(index) => _currentPageIndex = index;

  // - - - - - - - - - - - - - - - - - - NEXT PAGE BUTTON - - - - - - - - - - - - - - - - - -  //
  void onNextPage({required DeviceType deviceType}) {
    if (_currentPageIndex == lastPageNbr) {
      Get.offAll(switch (deviceType) {
        DeviceType.MOBILE => const MobileLoginScreen(),
        DeviceType.TABLE => const TabletLoginScreen(),
        DeviceType.WEB => const WebLoginScreen(),
      });
    } else {
      pageController.animateToPage(_currentPageIndex + 1,
          duration: const Duration(milliseconds: 1000), curve: Curves.linear);
    }
  }

  // - - - - - - - - - - - - - - - - - -  SKIP BUTTON - - - - - - - - - - - - - - - - - -  //
  void onSkip() {
    _currentPageIndex = lastPageNbr;
    pageController.animateToPage(lastPageNbr,
        duration: const Duration(milliseconds: 1000), curve: Curves.linear);
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
