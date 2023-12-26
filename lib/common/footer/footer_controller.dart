import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FooterController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController subjectController;
  late final TextEditingController messageController;
  late final GlobalKey<FormState> formState;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //

  @override
  void onInit() {
    super.onInit();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    subjectController = TextEditingController();
    messageController = TextEditingController();
    formState = GlobalKey<FormState>();
  }

  // - - - - - - - - - - - - - - - - - - ON SEND MESSAGE - - - - - - - - - - - - - - - - - -  //
  onSendMessage(){

  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
    formState.currentState?.dispose();
  }
}
