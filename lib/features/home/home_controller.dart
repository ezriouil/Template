import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/data/models/product.dart';

class HomeController extends GetxController{
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
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
    wishLists = RxList.empty();
    scrollController = ScrollController();
    showFloatingActionButton = false.obs;
    manageScrollController();
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

}