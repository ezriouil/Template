import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/data/models/product.dart';
import 'package:test1/data/repositories/remote_repositories/product_repository.dart';
import 'package:test1/features/product/screens/mobile_product_screen.dart';
import 'package:test1/features/product/screens/tablet_product_screen.dart';
import 'package:test1/features/store/widgets/custom_filter_bottom_sheet.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_icon_strings.dart';
import 'package:test1/utils/device/device_utility.dart';

class StoreController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final RxList<Product> productsLists, products;
  late final ScrollController scrollController;
  late final Rx<Color?> filterColorSelected;
  late final Rx<String?> filterCategorySelected, errorMsg;
  late RxBool isLoading;

  final durationSecond = const Duration(seconds: 1);

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    isLoading = true.obs;
    errorMsg = null.obs;
    productsLists = RxList.empty();
    products = RxList.empty();
    scrollController = ScrollController();
    filterColorSelected = colors.first.obs;
    filterCategorySelected = categories.first.obs;
    init();
  }

  // - - - - - - - - - - - - - - - - - - COLORS - - - - - - - - - - - - - - - - - -  //
  final colors = [
    CustomColors.BLACK,
    CustomColors.WHITE,
    CustomColors.RED,
    CustomColors.GREEN,
    CustomColors.YELLOW_LIGHT,
    CustomColors.BLUE,
    CustomColors.GREY_LIGHT,
  ];

  // - - - - - - - - - - - - - - - - - - CATEGORIES - - - - - - - - - - - - - - - - - -  //
  final categories = [
    CustomIconStrings.ALL_CATEGORIES,
    CustomIconStrings.CARDIGAN,
    CustomIconStrings.DRESS,
    CustomIconStrings.JACKET,
    CustomIconStrings.JEANS,
    CustomIconStrings.SCARF,
    CustomIconStrings.SNEAKERS,
    CustomIconStrings.TIE,
    CustomIconStrings.TSHIRT,
  ];

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init() async {
    await _onGetProducts();
    await Future.delayed(durationSecond);
    Get.bottomSheet(
        Obx(
          () => CustomFilterBottomSheet(
              colors: colors,
              categories: categories,
              colorSelected: filterColorSelected.value,
              onColorChange: (color) {
                filterColorSelected.value = color;
              },
              onCategoryChange: (category) {
                filterCategorySelected.value = category;
              },
              onFilter: () {},
              categorySelected: filterCategorySelected.value),
        ),
        enterBottomSheetDuration: durationSecond,
        exitBottomSheetDuration: durationSecond);
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
      products.addAll(productsLists);
      print("------------");
      print(products.length);
      print("--------------");

      /// STOP THE LOADER
      isLoading.value = false;
    } catch (_) {
      /// STOP THE LOADER
      isLoading.value = false;
      errorMsg.value = "Try again..";
    }
  }

  // - - - - - - - - - - - - - - - - - - FETCH PRODUCT FROM REMOTE DATABASE - - - - - - - - - - - - - - - - - -  //
  filter(String query) {
    List<Product> filteredList = [];
    if (query.isEmpty) {
      filteredList = products;
    } else {
      filteredList = products
          .where((product) => product.title!.toLowerCase().contains(query))
          .toList();
    }

    productsLists.value = filteredList;
  }

  // - - - - - - - - - - - - - - - - - - ON NAVIGATE TO SHOP SCREEN - - - - - - - - - - - - - - - - - -  //
  void onNavigateToProductScreen(
      {required DeviceType deviceType, required int id}) {
    switch (deviceType) {
      case DeviceType.MOBILE:
        Get.to(() => const MobileProductScreen(), arguments: id);
      case DeviceType.TABLE:Get.to(() => const TabletProductScreen(), arguments: id);
      case DeviceType.WEB:
      /*Get.off(const MobileStoreScreen(), arguments: true);*/
    }
  }

  // - - - - - - - - - - - - - - - - - - SHOW FILTER BOTTOM SHEET - - - - - - - - - - - - - - - - - -  //
  showFilterBottomSheet() {
    Get.bottomSheet(
        Obx(
          () => CustomFilterBottomSheet(
              colors: colors,
              categories: categories,
              colorSelected: filterColorSelected.value,
              onColorChange: (color) {
                filterColorSelected.value = color;
              },
              onCategoryChange: (category) {
                filterCategorySelected.value = category;
              },
              onFilter: () {},
              categorySelected: filterCategorySelected.value),
        ),
        enterBottomSheetDuration: durationSecond,
        exitBottomSheetDuration: durationSecond);
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    scrollController.dispose();
    filterColorSelected.close();
    filterCategorySelected.close();
    super.dispose();
  }
}
