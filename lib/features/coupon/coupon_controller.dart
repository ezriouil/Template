import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/data/models/coupon.dart';
import 'package:test1/data/repositories/remote_repositories/coupon_repository.dart';

class CouponController extends GetxController {
// - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //

  late final RxList<Coupon> coupon;
  late Rx<String?> errorMsg;
  late RxBool isLoading, showFloatingActionButton;
  late final ScrollController scrollController;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //

  @override
  void onInit() {
    super.onInit();
    isLoading = true.obs;
    errorMsg = null.obs;
    coupon = RxList.empty();
    init();
    scrollController = ScrollController();
    showFloatingActionButton = false.obs;
    manageScrollController();
  }

  init() async {
    await _onGetCoupons();
  }

  // - - - - - - - - - - - - - - - - - - GET COUPON FROM REMOTE DATABASE - - - - - - - - - - - - - - - - - -  //
  Future<void> _onGetCoupons() async {
    try {
      /// GET NOTIFICATIONS
      final getCoupons = await CouponRepository.getCoupons();

      if (getCoupons == null) {
        /// SHOW THE ERROR SNACK BAR
        isLoading.value = false;
        errorMsg.value = "Try again..";
        return;
      }

      if (getCoupons.isEmpty) {
        coupon.value = [];

        /// SHOW THE ERROR SNACK BAR
        isLoading.value = false;
        return;
      }
      coupon.addAll(getCoupons);

      /// STOP THE LOADER
      isLoading.value = false;
    } catch (_) {
      /// STOP THE LOADER
      isLoading.value = false;
      errorMsg.value = "Try again..";
    }
  }

  // - - - - - - - - - - - - - - - - - - SCROLL CONTROLLER - - - - - - - - - - - - - - - - - -  //
  manageScrollController() async {
    scrollController.addListener(() {
      double showOffset = 5.0;
      if (scrollController.offset > showOffset) {
        showFloatingActionButton.value = true;
      } else {
        showFloatingActionButton.value = false;
      }
    });
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    coupon.close();
    isLoading.close();
    errorMsg.close();
  }
}
