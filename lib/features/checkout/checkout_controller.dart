import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/common/widgets/custom_bottom_sheet.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/extensions/validator.dart';

class CheckoutController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final RxBool showFloatingActionButton;
  late final ScrollController scrollController;
  late final TextEditingController codePromoController,
      cardNumberController,
      cardNameController,
      expiryDateController,
      securityCodeController,
      zipCodeController;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    showFloatingActionButton = false.obs;
    codePromoController = TextEditingController();
    cardNumberController = TextEditingController();
    cardNameController = TextEditingController();
    expiryDateController = TextEditingController();
    securityCodeController = TextEditingController();
    zipCodeController = TextEditingController();
    init();
    manageScrollController();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init() async {}

  // - - - - - - - - - - - - - - - - - - SCROLL CONTROLLER - - - - - - - - - - - - - - - - - -  //
  manageScrollController() async {
    scrollController.addListener(() {
      double showOffset = 3.0;
      if (scrollController.offset > showOffset) {
        showFloatingActionButton.value = true;
      } else {
        showFloatingActionButton.value = false;
      }
    });
  }

  onChangePaymentMethod(){}

  onCheckout() {
    Get.bottomSheet(CustomBottomSheet(
      onClick: () {},
      cardNumberValidator: (value) {
        Validator.validateEmptyField(CustomTextStrings.CARD_NUMBER, value);
      },
      zipCodeValidator: (value) {
        Validator.validateEmptyField(CustomTextStrings.ZIP_CODE, value);
      },
      cardNameValidator: (value) {
        Validator.validateEmptyField(CustomTextStrings.CARD_NAME, value);
      },
      cardNameController: cardNumberController,
      cardNumberController: cardNumberController,
      zipCodeController: zipCodeController,
      expiryDayValidator: (value) {
        Validator.validateEmptyField(CustomTextStrings.ZIP_CODE, value);
      },
      securityCodeValidator: (value) {
        Validator.validateEmptyField(CustomTextStrings.ZIP_CODE, value);
      },
      securityCodeController: securityCodeController,
      expiryDateController: expiryDateController,
    ));
  }
}
