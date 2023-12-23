import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/common/widgets/custom_animation_screen.dart';
import 'package:test1/common/widgets/custom_snackbars.dart';
import 'package:test1/data/models/location_address.dart';
import 'package:test1/data/repositories/local_repository/location_address_repository.dart';
import 'package:test1/utils/local/database/app_database.dart';

class LocalizationAddressController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //

  late final TextEditingController userNameController;
  late final TextEditingController fullAddressController;
  late final TextEditingController nearbyController;
  late final TextEditingController cityController;
  late final TextEditingController stateCityController;
  late final TextEditingController zipCodeController;
  late final TextEditingController countryController;
  late final TextEditingController phoneController;

  late final GlobalKey<FormState> formState;
  late final AppDatabase? _database;
  late final LocationAddressRepository? _repository;
  late final RxList<LocationAddress> locationAddresses;
  late final LocationAddress? locationAddress;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    userNameController = TextEditingController();
    fullAddressController = TextEditingController();
    phoneController = TextEditingController();
    nearbyController = TextEditingController();
    cityController = TextEditingController();
    stateCityController = TextEditingController();
    zipCodeController = TextEditingController();
    countryController = TextEditingController();
    formState = GlobalKey<FormState>();
    _database = AppDatabase();
    locationAddresses = RxList.empty();
    _init();
  }

  Future<void> _init() async {
    final instance = await _database!.database;
    _repository = LocationAddressRepository(instance);
  }

  // - - - - - - - - - - - - - - - - - - INSERT NEW ADDRESS INTO LOCAL DATABASE - - - - - - - - - - - - - - - - - -  //
  Future<void> onInsertNewAddress() async {
    try {
      /// CHECK FROM VALIDATION
      if (!formState.currentState!.validate()) return;

      /// START LOADER
      Get.to(const CustomAnimationScreen(text: "We are saving your info ..."));
      await Future.delayed(const Duration(milliseconds: 500));

      /// INSERT NEW ADDRESS
      final LocationAddress locationAddress = LocationAddress(
          fullName: fullAddressController.text,
          fullAddress: fullAddressController.text,
          nearby: nearbyController.text,
          city: cityController.text,
          state: stateCityController.text,
          zipCode: zipCodeController.text,
          country: countryController.text,
          phone: phoneController.text);

      final int resultCode = await _repository!.insertAddress(locationAddress);

      if (resultCode == LocationAddressRepository.CODE_ERROR) {
        await Future.delayed(const Duration(milliseconds: 500));
        Get.back();
        await Future.delayed(const Duration(milliseconds: 500));

        /// SHOW THE ERROR SNACK BAR
        CustomSnackBars.error(
            title: "We can't insert this location address",
            message: "Try again.");
        return;
      }

      /// STOP THE LOADER
      Get.back();
      await Future.delayed(const Duration(milliseconds: 500));

      /// FINISHED
      CustomSnackBars.success(
          title: "Done", message: "Your address added successfully!");
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

  // - - - - - - - - - - - - - - - - - - GET ADDRESSES FROM LOCAL DATABASE - - - - - - - - - - - - - - - - - -  //
  Future<void> onGetAddresses() async {
    try {
      /// START LOADER
      Get.to(const CustomAnimationScreen(text: "We are saving your info ..."));
      await Future.delayed(const Duration(milliseconds: 500));

      /// GET ADDRESSES

      final addresses = await _repository!.getLocationAddresses();

      if (addresses == null) {
        await Future.delayed(const Duration(milliseconds: 500));
        Get.back();
        await Future.delayed(const Duration(milliseconds: 500));

        /// SHOW THE ERROR SNACK BAR
        CustomSnackBars.error(title: "No addresses", message: "Try next time!");
        return;
      }

      locationAddresses.addAll(addresses);

      /// STOP THE LOADER
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

  // - - - - - - - - - - - - - - - - - - UPDATE ADDRESS BY ID - - - - - - - - - - - - - - - - - -  //
  Future<void> onUpdateAddressById(int id) async {
    try {
      /// START LOADER
      Get.to(const CustomAnimationScreen(text: "We are saving your info ..."));
      await Future.delayed(const Duration(milliseconds: 500));

      /// UPDATE ADDRESS
      final LocationAddress locationAddress = LocationAddress(
          fullName: fullAddressController.text,
          fullAddress: fullAddressController.text,
          nearby: nearbyController.text,
          city: cityController.text,
          state: stateCityController.text,
          zipCode: zipCodeController.text,
          country: countryController.text,
          phone: phoneController.text);

      final int resultCode = await _repository!.updateLocationAddressById(
          localizationAddress: locationAddress, id: id);

      if (resultCode == LocationAddressRepository.CODE_ERROR) {
        await Future.delayed(const Duration(milliseconds: 500));
        Get.back();
        await Future.delayed(const Duration(milliseconds: 500));

        /// SHOW THE ERROR SNACK BAR
        CustomSnackBars.error(
            title: "We can't update this location address",
            message: "Try again.");
        return;
      }

      /// STOP THE LOADER
      Get.back();
      await Future.delayed(const Duration(milliseconds: 500));

      /// FINISHED
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

  // - - - - - - - - - - - - - - - - - - GET ADDRESS BY ID - - - - - - - - - - - - - - - - - -  //
  Future<void> onGetAddressById(int id) async {
    try {
      /// START LOADER
      Get.to(const CustomAnimationScreen(text: "We are saving your info ..."));
      await Future.delayed(const Duration(milliseconds: 500));

      /// GET ADDRESS BY ID

      locationAddress = await _repository!.getLocationAddressById(id: id);

      if (locationAddress == null) {
        await Future.delayed(const Duration(milliseconds: 500));
        Get.back();
        await Future.delayed(const Duration(milliseconds: 500));

        /// SHOW THE ERROR SNACK BAR
        CustomSnackBars.error(
            title: "We can't get this location address", message: "Try again.");
        return;
      }

      /// STOP THE LOADER
      Get.back();
      await Future.delayed(const Duration(milliseconds: 500));
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

  // - - - - - - - - - - - - - - - - - - DELETE ADDRESS BY ID - - - - - - - - - - - - - - - - - -  //
  Future<void> onDeleteAddressById(int id) async {
    try {
      /// START LOADER
      Get.to(const CustomAnimationScreen(text: "We are saving your info ..."));
      await Future.delayed(const Duration(milliseconds: 500));

      /// DELETE ADDRESS BY ID
      final resultCode = await _repository!.deleteLocationAddressById(id: id);

      if (resultCode == LocationAddressRepository.CODE_ERROR) {
        await Future.delayed(const Duration(milliseconds: 500));
        Get.back();
        await Future.delayed(const Duration(milliseconds: 500));

        /// SHOW THE ERROR SNACK BAR
        CustomSnackBars.error(
            title: "We can't delete this location address",
            message: "Try again.");
        return;
      }

      /// STOP THE LOADER
      Get.back();
      await Future.delayed(const Duration(milliseconds: 500));

      /// FINISHED
      CustomSnackBars.success(
          title: "Done", message: "Your address deleted successfully!");
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

  // - - - - - - - - - - - - - - - - - - DELETE ALL ADDRESSES - - - - - - - - - - - - - - - - - -  //
  Future<void> onDeleteAllAddresses() async {
    try {
      /// START LOADER
      Get.to(const CustomAnimationScreen(text: "We are saving your info ..."));
      await Future.delayed(const Duration(milliseconds: 500));

      /// DELETE ALL ADDRESSES
      final int resultCode = await _repository!.deleteLocationAddresses();

      if (resultCode == LocationAddressRepository.CODE_ERROR) {
        await Future.delayed(const Duration(milliseconds: 500));
        Get.back();
        await Future.delayed(const Duration(milliseconds: 500));

        /// SHOW THE ERROR SNACK BAR
        CustomSnackBars.error(
            title: "We can't delete your location addresses",
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

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    fullAddressController.dispose();
    nearbyController.dispose();
    cityController.dispose();
    stateCityController.dispose();
    zipCodeController.dispose();
    countryController.dispose();
    phoneController.dispose();
    _repository = null;
    locationAddress = null;
    locationAddresses.close();
    _database = null;
  }

}
