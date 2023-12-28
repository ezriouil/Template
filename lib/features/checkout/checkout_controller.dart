import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/common/widgets/custom_dialog.dart';
import 'package:test1/common/widgets/custom_snackbars.dart';
import 'package:test1/data/models/location_address.dart';
import 'package:test1/data/repositories/local_repositories/location_address_repository.dart';
import 'package:test1/features/checkout/widgets/custom_addresses_bottom_sheet.dart';
import 'package:test1/features/checkout/widgets/custom_checkout_bottom_sheet.dart';
import 'package:test1/features/checkout/widgets/custom_payment_methode.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/extensions/validator.dart';
import 'package:test1/utils/local/database/app_database.dart';

class CheckoutController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final TextEditingController codePromoController,
      cardNumberController,
      cardNameController,
      expiryDateController,
      securityCodeController,
      zipCodeController;

  late final AppDatabase? _database;
  late final LocationAddressRepository? _repository;

  late Rx<LocationAddress?> onSelected, currentLocationAddress;
  late RxList<LocationAddress>? locationAddresses;

  late final RxString methodPaymentSelectedValue;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //

  @override
  void onInit() {
    super.onInit();
    codePromoController = TextEditingController();
    cardNumberController = TextEditingController();
    cardNameController = TextEditingController();
    expiryDateController = TextEditingController();
    securityCodeController = TextEditingController();
    zipCodeController = TextEditingController();
    onSelected = LocationAddress().obs;
    currentLocationAddress = LocationAddress().obs;
    locationAddresses = RxList.empty();
    methodPaymentSelectedValue = "Online".obs;
    _database = AppDatabase();
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init() async {
    final instance = await _database!.database;
    _repository = LocationAddressRepository(instance);
    await onGetAddresses();
  }

  // - - - - - - - - - - - - - - - - - - CHANGE PAYMENT METHODE - - - - - - - - - - - - - - - - - -  //
  onChangePaymentMethod() {
    Get.bottomSheet(Obx(
      () => CustomPaymentMethode(
          selectedValue: methodPaymentSelectedValue.value,
          onSelectedOffline: (value) {
            methodPaymentSelectedValue.value = value!;
            Get.back();
          },
          onSelectedOnline: (value) {
            methodPaymentSelectedValue.value = value!;
            Get.back();
          }),
    ));
  }

  // - - - - - - - - - - - - - - - - - - CHANGE PAYMENT METHODE - - - - - - - - - - - - - - - - - -  //
  onChangeLocationAddress() async {
    Get.bottomSheet(
      Obx(
        () => CustomAddressBottomSheet(
            onSelected: (value) {
              currentLocationAddress.value = value;
              Get.back();
            },
            locationAddresses: locationAddresses,
            locationAddress: currentLocationAddress.value),
      ),
    );
  }

  // - - - - - - - - - - - - - - - - - - GET ADDRESSES FROM LOCAL DATABASE - - - - - - - - - - - - - - - - - -  //
  Future<void> onGetAddresses() async {
    try {
      /// GET ADDRESSES
      final addresses = await _repository!.getLocationAddresses();

      if (addresses == null) {
        /// SHOW THE ERROR SNACK BAR
        CustomSnackBars.error(title: "No addresses", message: "Try next time!");
        return;
      }

      locationAddresses?.addAll(addresses);

      if (locationAddresses!.isNotEmpty) {
        currentLocationAddress.value = locationAddresses!.first;
      }

      /// STOP THE LOADER
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

  // - - - - - - - - - - - - - - - - - - VALIDATE CODE PROMO BUTTON - - - - - - - - - - - - - - - - - -  //
  onValidateCodePromo() {}

  // - - - - - - - - - - - - - - - - - - CHECKOUT BUTTON - - - - - - - - - - - - - - - - - -  //
  onCheckout() {
    if (methodPaymentSelectedValue.value == "Online") {
      Get.bottomSheet(
        CustomCheckoutBottomSheet(
          onClick: () async {
            Get.back();
            await Future.delayed(const Duration(milliseconds: 300));
            dialog(isOnline: true);
          },
          cardNumberValidator: (value) => Validator.validateEmptyField(
              CustomTextStrings.CARD_NUMBER, value),
          zipCodeValidator: (value) =>
              Validator.validateEmptyField(CustomTextStrings.ZIP_CODE, value),
          cardNameValidator: (value) =>
              Validator.validateEmptyField(CustomTextStrings.CARD_NAME, value),
          expiryDayValidator: (value) => Validator.validateEmptyField(
              CustomTextStrings.EXPIRY_DATE, value),
          securityCodeValidator: (value) => Validator.validateEmptyField(
              CustomTextStrings.SECURITY_CODE, value),
          cardNameController: cardNumberController,
          cardNumberController: cardNumberController,
          zipCodeController: zipCodeController,
          securityCodeController: securityCodeController,
          expiryDateController: expiryDateController,
        ),
      );
    }
    if (methodPaymentSelectedValue.value == "Offline") {
      dialog(isOnline: false);
    }
  }

// - - - - - - - - - - - - - - - - - - DIALOG - - - - - - - - - - - - - - - - - -  //
  dialog({required bool isOnline}) {
    Get.defaultDialog(
        title: "",
        middleText: "",
        titlePadding: EdgeInsets.zero,
        content: CustomDialog(
          title: "Confirm your payment",
          subTitle: "By clicking on accept you will complete your paiment",
          buttonLeftTitle: "Cancel",
          buttonRightTitle: "Agree",
          onButtonRightClick: () {
            isOnline ? printInfo(info: "yes") : printInfo(info: "no");
          },
          onButtonLeftClick: Get.back,
        ),
        backgroundColor: Colors.transparent);
  }
}
