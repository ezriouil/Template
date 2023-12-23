import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/common/footer/cookies.dart';
import 'package:test1/common/footer/faq.dart';
import 'package:test1/common/footer/mobile_application.dart';
import 'package:test1/common/footer/payment_methods_offline.dart';
import 'package:test1/common/footer/payment_methods_online.dart';
import 'package:test1/common/footer/security.dart';
import 'package:test1/common/footer/shipping.dart';
import 'package:test1/common/footer/store_history.dart';

class NavigateIn {
  NavigateIn._();

  static void onNavigateToSecurity(BuildContext context) {
    _onNavigateWithoutGetX(const Security(), context);
  }

  static void onNavigateToCookies(BuildContext context) {
    _onNavigateWithoutGetX(const Cookies(), context);
  }

  static void onNavigateToStoreHistory(BuildContext context) {
    _onNavigateWithoutGetX(const StoreHistory(), context);
  }

  static void onNavigateToPaymentMethodsOnline(BuildContext context) {
    _onNavigateWithoutGetX(const PaymentMethodsOnline(), context);
  }

  static void onNavigateToPaymentMethodsOffline(BuildContext context) {
    _onNavigateWithoutGetX(const PaymentMethodsOffline(), context);
  }

  static void onNavigateToFAQ(BuildContext context) {
    _onNavigateWithoutGetX(const FAQ(), context);
  }

  static void onNavigateToShipping(BuildContext context) {
    _onNavigateWithoutGetX(const Shipping(), context);
  }

  static void onNavigateToMobileApplication(BuildContext context) {
    _onNavigateWithoutGetX(const MobileApplication(), context);
  }

  static void onBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  /// NAVIGATION METHODS
  static void _onNavigateUsingGetX(Widget page) {
    Get.to(() => page);
  }

  static void _onNavigateWithoutGetX(Widget page, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}
