import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/data/models/product.dart';

class HomeController extends GetxController{
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final RxList<Product> productsLists;
  late Rx<String?> errorMsg;
  late RxBool isLoading;
  late final ScrollController scrollController;
  late CarouselController pageController;
  late RxInt currentPageIndex;

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
  }

}