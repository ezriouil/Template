import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test1/common/widgets/custom_snackbars.dart';
import 'package:test1/utils/helpers/network.dart';

class ProfileController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //

  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController userNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;

  late final GlobalKey<FormState> formState;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //

  @override
  void onInit() {
    super.onInit();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    formState = GlobalKey<FormState>();
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    formState.currentState?.dispose();
  }

  // - - - - - - - - - - - - - - - - - - UPDATE PROFILE INFO - - - - - - - - - - - - - - - - - -  //
  onUpdateProfile() {}

  // - - - - - - - - - - - - - - - - - - UPDATE PROFILE INFO - - - - - - - - - - - - - - - - - -  //
  onDeleteProfile() {}

  // - - - - - - - - - - - - - - - - - - CHECK THE NETWORK - - - - - - - - - - - - - - - - - -  //
  Future<bool> _checkTheNetwork() async {
    final hasNetwork = await Network.hasConnection();
    if (!hasNetwork) {
      CustomSnackBars.error(
          icon: Iconsax.wifi,
          title: "No internet connection",
          message: "please check your network device.");
      return false;
    }
    return true;
  }

  // - - - - - - - - - - - - - - - - - - CHECK THE NETWORK - - - - - - - - - - - - - - - - - -  //
  selectPictureFromDevice() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      //final imagePath = File(image.path);
    } on PlatformException catch (_) {
      CustomSnackBars.error(
          icon: Iconsax.wifi, title: "Error 404", message: "please try again");
    }
  }
}
