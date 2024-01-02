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
    CustomColors.RED,
    CustomColors.GREEN,
    CustomColors.WHITE,
    CustomColors.YELLOW_LIGHT,
    CustomColors.BLUE,
    CustomColors.BLACK,
    CustomColors.GREY_LIGHT,
  ];

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

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init() async {}

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  showFilterBottomSheet() {
    Get.bottomSheet(Obx(
      () => CustomFilterBottomSheet(
          colors: colors,
          categories: categories,
          colorSelected: filterColorSelected.value,
          onColorChange: (color) {
            filterColorSelected.value = color;
            print(color);
          },
          onCategoryChange: (category) {
            filterCategorySelected.value = category;
          },
          onFilter: () {
            Get.back();
          },
          categorySelected: filterCategorySelected.value),
    ));
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
  }
}
