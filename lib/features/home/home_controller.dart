import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/data/models/product.dart';
import 'package:test1/data/repositories/remote_repositories/product_repository.dart';
import 'package:test1/features/index/index_controller.dart';
import 'package:test1/features/product/screens/mobile_product_screen.dart';
import 'package:test1/features/product/screens/tablet_product_screen.dart';
import 'package:test1/features/product/screens/web_product_screen.dart';
import 'package:test1/features/store/screens/mobile_store_screen.dart';
import 'package:test1/features/store/screens/tablet_store_screen.dart';
import 'package:test1/utils/constants/custom_icon_strings.dart';
import 'package:test1/utils/device/device_utility.dart';

class HomeController extends GetxController{
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final RxList<Product> productsLists;
  late Rx<String?> errorMsg;
  late RxBool isLoading;
  late final ScrollController scrollController;
  late CarouselController pageController;
  late RxInt currentPageIndex;
  late DeviceType deviceType;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    isLoading = true.obs;
    errorMsg = null.obs;
    productsLists = RxList.empty();
    scrollController = ScrollController();
    pageController = CarouselController();
    currentPageIndex = 0.obs;
    init();
  }

  // - - - - - - - - - - - - - - - - - - ON NAVIGATE TO SHOP SCREEN - - - - - - - - - - - - - - - - - -  //
  init()async {
    await _onGetProducts();
  }

  // - - - - - - - - - - - - - - - - - - ON NAVIGATE TO SHOP SCREEN - - - - - - - - - - - - - - - - - -  //
  void onNavigateToProductScreen({ required int id}){
    switch(deviceType){
      case DeviceType.MOBILE: Get.to(()=>const MobileProductScreen(), arguments: id);
      case DeviceType.TABLE:  Get.to(const TabletProductScreen(), arguments: id);
      case DeviceType.WEB:  Get.to(const WebProductScreen(), arguments: true);
    }
  }

  // - - - - - - - - - - - - - - - - - - ON NAVIGATE TO SHOP SCREEN - - - - - - - - - - - - - - - - - -  //
  void onNavigateToShopScreen(){
    switch(deviceType){
      case DeviceType.MOBILE: {
        IndexController.currentIndex.value = 1;
      }
      case DeviceType.TABLE:  {
        IndexController.currentIndex.value = 1;
      }
      case DeviceType.WEB:  Get.to(const MobileStoreScreen(), arguments: true);
    }
  }

  // - - - - - - - - - - - - - - - - - - FETCH PRODUCT FROM REMOTE DATABASE - - - - - - - - - - - - - - - - - -  //
  Future<void> _onGetProducts() async {
    try {
      /// GET NOTIFICATIONS
      final getProducts = await ProductRepository.getProducts();

      if (getProducts == null) {
        /// SHOW THE ERROR SNACK BAR
        isLoading.value = false;
        errorMsg.value = "Try again..";
        return;
      }

      if (getProducts.isEmpty) {
        productsLists.value = [];

        /// SHOW THE ERROR SNACK BAR
        isLoading.value = false;
        return;
      }
      productsLists.addAll(getProducts);

      /// STOP THE LOADER
      isLoading.value = false;
    } catch (_) {
      /// STOP THE LOADER
      isLoading.value = false;
      errorMsg.value = "Try again..";
    }
  }

  // - - - - - - - - - - - - - - - - - - CATEGORIES - - - - - - - - - - - - - - - - - -  //
  final categories = [
    CustomIconStrings.CARDIGAN,
    CustomIconStrings.DRESS,
    CustomIconStrings.JACKET,
    CustomIconStrings.JEANS,
    CustomIconStrings.SCARF,
    CustomIconStrings.SNEAKERS,
    CustomIconStrings.TIE,
    CustomIconStrings.TSHIRT,
  ];

}