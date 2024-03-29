import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_elevated_button.dart';
import 'package:test1/common/widgets/custom_text_field.dart';
import 'package:test1/features/auth/forget_password/forget_password_controller.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/extensions/validator.dart';
import 'package:test1/utils/responsive/responsive.dart';

class TabletForgetPassword extends Responsive {
  const TabletForgetPassword({super.key});

  @override
  Widget execute(BuildContext context) {
    // - - - - - - - - - - - - - - - - - - INSTANCE FROM THE CONTROLLER - - - - - - - - - - - - - - - - - -  //
    final ForgetPasswordController controller = Get.put(ForgetPasswordController());
    controller.deviceType = DeviceType.TABLE;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: CustomSizes.SPACE_DEFAULT,
              horizontal: CustomSizes.SPACE_DEFAULT),
          child: Form(
              key: controller.formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Forget password",
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 40)),
                  const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                  Text(
                      "Don't worry sometimes people can forget too, entre your email and we will send you a password reset link.",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18)),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                  // - - - - - - - - - - - - - - - - - - EMAIL - - - - - - - - - - - - - - - - - -  //

                  CustomTextField(
                      leadingIcon: Iconsax.direct_right,
                      hint: CustomTextStrings.EMAIL,
                      controller: controller.emailController,
                      validator: (value) => Validator.validateEmailField(value),
                      height: CustomSizes.TABLET_TEXT_FIELD,
                      textInputType: TextInputType.emailAddress,
                      withDefaultPadding: false),
                  const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                  // - - - - - - - - - - - - - - - - - - SENT TO EMAIL - - - - - - - - - - - - - - - - - -  //
                  CustomElevatedButton(
                    text: "Submit",
                    onClick: controller.sendToEmail,
                    height: CustomSizes.TABLET_ELEVATED_BUTTON,
                    withDefaultPadding: false,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}