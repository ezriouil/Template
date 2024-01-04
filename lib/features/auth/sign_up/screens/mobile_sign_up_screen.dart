import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_elevated_button.dart';
import 'package:test1/common/widgets/custom_icon_outlined_button.dart';
import 'package:test1/common/widgets/custom_text_field.dart';
import 'package:test1/features/auth/sign_up/sign_up_controller.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_icon_strings.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/extensions/validator.dart';
import 'package:test1/utils/responsive/responsive.dart';

class MobileSignUpScreen extends Responsive {
  const MobileSignUpScreen({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - - - - - - - - - - - - INSTANCE FROM THE CONTROLLER - - - - - - - - - - - - - - - - - -  //
    final SignUpController controller = Get.put(SignUpController());
    controller.deviceType = DeviceType.MOBILE;

    return Scaffold(
      appBar: AppBar(leading: null),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: CustomSizes.SPACE_BETWEEN_ITEMS /2,
              horizontal: CustomSizes.SPACE_DEFAULT),
          child: Form(
              key: controller.formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Let's create your account",
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                  Row(
                    children: [
                      // - - - - - - - - - - - - - - - - - - FIRST NAME - - - - - - - - - - - - - - - - - -  //
                      Expanded(
                        flex: 1,
                        child: CustomTextField(
                            leadingIcon: Iconsax.user,
                            hint: CustomTextStrings.FISRT_NAME,
                            controller: controller.firstNameController,
                            validator: (value) => Validator.validateEmptyField(
                                CustomTextStrings.FISRT_NAME, value),
                            width: getWidth(context),
                            withDefaultPadding: false),
                      ),
                      const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
                      // - - - - - - - - - - - - - - - - - - LAST NAME - - - - - - - - - - - - - - - - - -  //
                      Expanded(
                        flex: 1,
                        child: CustomTextField(
                            leadingIcon: Iconsax.user,
                            hint: CustomTextStrings.LAST_NAME,
                            controller: controller.lastNameController,
                            validator: (value) => Validator.validateEmptyField(
                                CustomTextStrings.LAST_NAME, value),
                            width: getWidth(context),
                            withDefaultPadding: false),
                      ),
                    ],
                  ),
                  // - - - - - - - - - - - - - - - - - - USER NAME - - - - - - - - - - - - - - - - - -  //
                  CustomTextField(
                      leadingIcon: Iconsax.user_edit,
                      hint: CustomTextStrings.USER_NAME,
                      controller: controller.userNameController,
                      validator: (value) => Validator.validateEmptyField(
                          CustomTextStrings.USER_NAME, value),
                      width: getWidth(context),
                      withDefaultPadding: false),

                  // - - - - - - - - - - - - - - - - - - EMAIL - - - - - - - - - - - - - - - - - -  //

                  CustomTextField(
                      leadingIcon: Iconsax.direct_right,
                      hint: CustomTextStrings.EMAIL,
                      controller: controller.emailController,
                      validator: (value) => Validator.validateEmailField(value),
                      width: getWidth(context),
                      textInputType: TextInputType.emailAddress,
                      withDefaultPadding: false),

                  // - - - - - - - - - - - - - - - - - - PHONE - - - - - - - - - - - - - - - - - -  //

                  CustomTextField(
                      leadingIcon: Iconsax.call,
                      hint: CustomTextStrings.PHONE,
                      controller: controller.phoneController,
                      validator: (value) => Validator.validateEmptyField(
                          CustomTextStrings.PHONE, value),
                      width: getWidth(context),
                      textInputType: TextInputType.phone,
                      withDefaultPadding: false),

                  // - - - - - - - - - - - - - - - - - - PASSWORD - - - - - - - - - - - - - - - - - -  //

                  Obx(
                    () => CustomTextField(
                      leadingIcon: Iconsax.password_check,
                      controller: controller.passwordController,
                      validator: (value) =>
                          Validator.validatePasswordField(value),
                      hint: CustomTextStrings.PASSWORD,
                      width: getWidth(context),
                      withDefaultPadding: false,
                      textInputType: TextInputType.visiblePassword,
                      obscureText: controller.passwordObscure.value,
                      trailingIcon: InkWell(
                        onTap: () => {
                          controller.passwordObscure.value = !controller.passwordObscure.value
                        },
                        child: Icon(
                            controller.passwordObscure.value
                                ? Iconsax.eye_slash
                                : Iconsax.eye,
                            color: isDark(context)
                                ? CustomColors.GREY_DARK
                                : CustomColors.GREY_LIGHT),
                      ),
                    ),
                  ),

                  // - - - - - - - - - - - - - - - - - - CHECKBOX - - - - - - - - - - - - - - - - - -  //

                  Row(children: [
                    Obx(
                      () => Checkbox(
                          value: controller.checkbox.value,
                          onChanged: (value) => {
                                controller.checkbox.value =
                                    !controller.checkbox.value
                              }),
                    ),
                    Text.rich(TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          const TextSpan(text: "I agree to "),
                          TextSpan(
                              text: CustomTextStrings.COOKIES,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: primaryColor(context),
                                      decoration: TextDecoration.underline,
                                      decorationColor: primaryColor(context))),
                          const TextSpan(text: " and "),
                          TextSpan(
                              text: CustomTextStrings.CONDITIONS,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: primaryColor(context),
                                      decoration: TextDecoration.underline,
                                      decorationColor: primaryColor(context))),
                        ])),
                  ]),
                  CustomElevatedButton(
                    text: "Create Account",
                    onClick: controller.onCreateAccount,
                    width: getWidth(context),
                    withDefaultPadding: false,
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Divider(
                          color: grayColor(context),
                          height: CustomSizes.SPACE_BETWEEN_SECTIONS,
                          indent: CustomSizes.SPACE_DEFAULT,
                          thickness: 0.5,
                        ),
                      ),
                      const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
                      Text(
                        "Or sign up with",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
                      Expanded(
                        flex: 1,
                        child: Divider(
                          color: grayColor(context),
                          endIndent: CustomSizes.SPACE_DEFAULT,
                          height: CustomSizes.SPACE_BETWEEN_SECTIONS,
                          thickness: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconOutlinedButton(
                          icon: CustomIconStrings.GOOGLE_RGB,
                          onClick: () => {
                               controller.onSingUpWithGoogle()
                              }),
                      const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
                      CustomIconOutlinedButton(
                          icon: CustomIconStrings.FACEBOOK_RGB,
                          onClick: () => {controller.onSingUpWithFacebook()}),
                    ],
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                ],
              )),
        ),
      ),
    );
  }
}
