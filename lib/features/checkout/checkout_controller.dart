import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/common/widgets/custom_dialog.dart';
import 'package:test1/common/widgets/custom_snackbars.dart';
import 'package:test1/data/models/location_address.dart';
import 'package:test1/data/models/product.dart';
import 'package:test1/data/repositories/local_repositories/cart_repository.dart';
import 'package:test1/data/repositories/local_repositories/location_address_repository.dart';
import 'package:test1/features/checkout/widgets/custom_addresses_bottom_sheet.dart';
import 'package:test1/features/checkout/widgets/custom_checkout_bottom_sheet.dart';
import 'package:test1/features/checkout/widgets/custom_payment_methode.dart';
import 'package:test1/utils/constants/custom_colors.dart';
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
  late final LocationAddressRepository? _locationRepository;
  late final CartRepository? _cartRepository;

  late Rx<LocationAddress?> onSelected, currentLocationAddress;
  late RxList<LocationAddress> locationAddresses;
  late RxList<Product> cartProducts;

  late int subTotal;

  late final RxString methodPaymentSelectedValue;

  final durationSecond = const Duration(seconds: 1);

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    cardNumberController = TextEditingController();
    cardNameController = TextEditingController();
    expiryDateController = TextEditingController();
    securityCodeController = TextEditingController();
    zipCodeController = TextEditingController();
    codePromoController = TextEditingController();
    onSelected = LocationAddress().obs;
    currentLocationAddress = LocationAddress().obs;
    locationAddresses = RxList.empty();
    cartProducts = RxList.empty();
    methodPaymentSelectedValue = "Online".obs;
    subTotal = Get.arguments;
    _database = AppDatabase();
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init() async {
    final instance = await _database!.database;
    _locationRepository = LocationAddressRepository(instance);
    _cartRepository = CartRepository(instance);
    await onGetCartProducts();
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
      ),enterBottomSheetDuration:durationSecond, exitBottomSheetDuration: durationSecond
    );
  }

  // - - - - - - - - - - - - - - - - - - GET ADDRESSES FROM LOCAL DATABASE - - - - - - - - - - - - - - - - - -  //
  Future<void> onGetAddresses() async {
    try {
      /// GET ADDRESSES
      final addresses = await _locationRepository!.getLocationAddresses();

      if (addresses == null) {
        /// SHOW THE ERROR SNACK BAR
        CustomSnackBars.error(title: "No addresses", message: "Try next time!");
        return;
      }

      locationAddresses.addAll(addresses);

      if (locationAddresses.isNotEmpty) {
        currentLocationAddress.value = locationAddresses.first;
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

  // - - - - - - - - - - - - - - - - - - GET PRODUCTS FROM CART - - - - - - - - - - - - - - - - - -  //
  Future onGetCartProducts() async {
    try {
      /// GET WISHLISTS
      final getProductsFromCart = await _cartRepository!.getProductsFromCart();
      await Future.delayed(const Duration(milliseconds: 500));


      if (getProductsFromCart == null) {
        return;
      }

      if (getProductsFromCart.isEmpty) {
        cartProducts.value = [];
        return;
      }

      cartProducts.addAll(getProductsFromCart);

      /// STOP THE LOADER
    } catch (_) {}
  }

  // - - - - - - - - - - - - - - - - - - VALIDATE CODE PROMO BUTTON - - - - - - - - - - - - - - - - - -  //
  onValidateCodePromo() {
    if(codePromoController.text.isEmpty){
      CustomSnackBars.error(title: "Field empty", message: "please try again!");
      return;
    }
  }

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
          enterBottomSheetDuration:durationSecond, exitBottomSheetDuration: durationSecond
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
        backgroundColor: CustomColors.TRANSPARENT,
        content: CustomDialog(
          title: "Confirm your payment",
          subTitle: "By clicking on accept you will complete your paiment",
          buttonLeftTitle: "Cancel",
          buttonRightTitle: "Agree",
          onButtonRightClick: () {
            isOnline ? printInfo(info: "yes") : printInfo(info: "no");
          },
          onButtonLeftClick: Get.back,
        ));
  }
}
