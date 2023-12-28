import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/common/widgets/custom_animation_screen.dart';
import 'package:test1/common/widgets/custom_snackbars.dart';
import 'package:test1/data/models/product.dart';
import 'package:test1/data/repositories/local_repositories/wish_list_repository.dart';
import 'package:test1/features/product/screens/mobile_product_screen.dart';
import 'package:test1/features/product/screens/tablet_product_screen.dart';
import 'package:test1/features/product/screens/web_product_screen.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/local/database/app_database.dart';

class WishListController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final AppDatabase? _database;
  late final WishListRepository? _repository;
  late final RxList<Product> wishLists;
  late Rx<String?> errorMsg;
  late RxBool isLoading, showFloatingActionButton;
  late final ScrollController scrollController;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    isLoading = true.obs;
    errorMsg = null.obs;
    _database = AppDatabase();
    wishLists = RxList.empty();
    _init();
    scrollController = ScrollController();
    showFloatingActionButton = false.obs;
    manageScrollController();
  }

  // - - - - - - - - - - - - - - - - - - INJECT DEPENDENCIES - - - - - - - - - - - - - - - - - -  //
  Future<void> _init() async {
    final instance = await _database!.database;
    _repository = WishListRepository(instance);
    await onGetWishLists();
  }

  // - - - - - - - - - - - - - - - - - - GET WISHLISTS FROM LOCAL DATABASE - - - - - - - - - - - - - - - - - -  //
  Future<void> onGetWishLists() async {
    try {

      /// GET WISHLISTS
      final getWishLists = await _repository!.getWishLists();
      await Future.delayed(const Duration(milliseconds: 500));

      if (getWishLists == null) {
        await Future.delayed(const Duration(milliseconds: 500));

        /// SHOW THE ERROR SNACK BAR
        isLoading.value = false;
        errorMsg.value = "Try again..";
        return;
      }

      if (getWishLists.isEmpty) {
        wishLists.value = [];
        /// SHOW THE ERROR SNACK BAR
        isLoading.value = false;
        return;
      }
      isLoading.value = false;
      wishLists.addAll(getWishLists);

      /// STOP THE LOADER
    } catch (_) {
      /// STOP THE LOADER
      isLoading.value = false;
      errorMsg.value = "Try again..";
    }
  }

  // - - - - - - - - - - - - - - - - - - SCROLL CONTROLLER - - - - - - - - - - - - - - - - - -  //
  manageScrollController() async {
    scrollController.addListener(() {
      //scroll listener
      double showOffset = 5.0;
      if (scrollController.offset > showOffset) {
        showFloatingActionButton.value = true;
      } else {
        showFloatingActionButton.value = false;
      }
    });
  }

  // - - - - - - - - - - - - - - - - - - DELETE WISHLIST BY ID - - - - - - - - - - - - - - - - - -  //
  Future<void> onDeleteWishListById(Product product) async {
    try {
      /// START LOADER
      Get.to(const CustomAnimationScreen(text: "We are saving your info ..."));
      await Future.delayed(const Duration(milliseconds: 500));

      /// DELETE WISHLIST BY ID
      final resultCode = await _repository!.deleteWishListById(id: product.id!);

      if (resultCode == WishListRepository.CODE_ERROR) {
        await Future.delayed(const Duration(milliseconds: 500));
        Get.back();
        await Future.delayed(const Duration(milliseconds: 500));

        /// SHOW THE ERROR SNACK BAR
        CustomSnackBars.error(
            title: "We can't delete this wishList", message: "Try again.");
        return;
      }
      wishLists.remove(product);

      /// STOP THE LOADER
      Get.back();
      await Future.delayed(const Duration(milliseconds: 500));
      /// FINISHED
      CustomSnackBars.success(
          title: "Done", message: "Your wishList deleted successfully!");
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

  // - - - - - - - - - - - - - - - - - - NAVIGATE TO PRODUCT SCREEN BY ID - - - - - - - - - - - - - - - - - -  //
  onNavigateToProductScreen(int id, DeviceType deviceType) {
    switch (deviceType) {
      case DeviceType.MOBILE:
        Get.off(() => const MobileProductScreen(), arguments: id);
      case DeviceType.TABLE:
        Get.off(() => const TabletProductScreen(), arguments: id);
      case DeviceType.WEB:
        Get.off(() => const WebProductScreen(), arguments: id);
    }
  }

  // - - - - - - - - - - - - - - - - - - DELETE ALL WISHLIST - - - - - - - - - - - - - - - - - -  //
  /*
  Future<void> onDeleteAllWishLists() async {
    try {
      /// START LOADER
      Get.to(const CustomAnimationScreen(text: "We are saving your info ..."));
      await Future.delayed(const Duration(milliseconds: 500));

      /// DELETE ALL ADDRESSES
      final int resultCode = await _repository!.deleteWishLists();

      if (resultCode == WishListRepository.CODE_ERROR) {
        await Future.delayed(const Duration(milliseconds: 500));
        Get.back();
        await Future.delayed(const Duration(milliseconds: 500));

        /// SHOW THE ERROR SNACK BAR
        CustomSnackBars.error(
            title: "We can't delete your wishLists",
            message: "Try again.");
        return;
      }

      /// STOP THE LOADER
      Get.back();
      await Future.delayed(const Duration(milliseconds: 500));

      /// FINISHED
      Get.back();
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
   */

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    _repository = null;
    wishLists.close();
    _database = null;
    isLoading.close();
    errorMsg.close();
  }
}
