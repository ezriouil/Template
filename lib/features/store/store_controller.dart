import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/features/store/widgets/custom_filter_bottom_sheet.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_icon_strings.dart';

class StoreController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final ScrollController scrollController;
  late final Rx<Color?> filterColorSelected;
  late final Rx<String?> filterCategorySelected;

  final durationSecond = const Duration(seconds: 1);

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
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
    await Future.delayed(durationSecond);
    Get.bottomSheet(Obx(
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
          onFilter: () {

          },
          categorySelected: filterCategorySelected.value),
    ),enterBottomSheetDuration:durationSecond, exitBottomSheetDuration: durationSecond);
  }

  // - - - - - - - - - - - - - - - - - - SHOW FILTER BOTTOM SHEET - - - - - - - - - - - - - - - - - -  //
  showFilterBottomSheet() {
    Get.bottomSheet(Obx(
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
          onFilter: () {

          },
          categorySelected: filterCategorySelected.value),
    ),enterBottomSheetDuration:durationSecond, exitBottomSheetDuration: durationSecond);
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
  }
}
