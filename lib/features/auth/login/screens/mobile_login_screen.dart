import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_elevated_button.dart';
import 'package:test1/common/widgets/custom_icon_outlined_button.dart';
import 'package:test1/common/widgets/custom_outlined_button.dart';
import 'package:test1/common/widgets/custom_text_field.dart';
import 'package:test1/features/auth/login/login_controller.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_icon_strings.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/extensions/validator.dart';
import 'package:test1/utils/responsive/responsive.dart';

class MobileLoginScreen extends Responsive {
  const MobileLoginScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    // - - - - - - - - - - - - - - - - - - INSTANCE FROM THE CONTROLLER - - - - - - - - - - - - - - - - - -  //
    final LoginController controller = Get.put(LoginController());
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT, vertical: CustomSizes.SPACE_BETWEEN_SECTIONS * 2),
          child: Form(
              key: controller.formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    CustomIconStrings.APP_LOGO,
                    height: 100,
                    width: 150,color: darkLightColor(context),
                  ),
                  const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                  Text("Welcome back,",
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                  Text("Discover Limitless Choices and Unmatched Convenience",
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                  // - - - - - - - - - - - - - - - - - - EMAIL - - - - - - - - - - - - - - - - - -  //

                  CustomTextField(
                      leadingIcon: Iconsax.direct_right,
                      hint: CustomTextStrings.EMAIL,
                      controller: controller.emailController,
                      validator: (value) => Validator.validateEmailField(value),
                      width: getWidth(context),
                      textInputType: TextInputType.emailAddress,
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
                          controller.passwordObscure.value =
                          !controller.passwordObscure.value
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
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),

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
                    Text("Remember me",
                        style: Theme.of(context).textTheme.bodyMedium),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        controller.onNavigateToForgetPasswordScreen(
                            deviceType: DeviceType.MOBILE);
                      },
                      // - - - - - - - - - - - - - - - - - - FORGET THE PASSWORD - - - - - - - - - - - - - - - - - -  //
                      child: Text("Forger Password?",
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
                  ]),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                  // - - - - - - - - - - - - - - - - - - LOGIN BUTTON - - - - - - - - - - - - - - - - - -  //
                  CustomElevatedButton(
                    text: "Login",
                    onClick: controller.onLogin,
                    width: getWidth(context),
                    withDefaultPadding: false,
                  ),
                  // - - - - - - - - - - - - - - - - - - SING UP BUTTON - - - - - - - - - - - - - - - - - -  //
                  CustomOutlinedButton(
                    text: "Create account",
                    onClick: () {
                      controller.onNavigateToSingUpScreen(
                          deviceType: DeviceType.MOBILE);
                    },
                    width: getWidth(context),
                    withDefaultPadding: false,
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
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
                        "Or login with",
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
                      // - - - - - - - - - - - - - - - - - - LOGIN WITH GOOGLE - - - - - - - - - - - - - - - - - -  //
                      CustomIconOutlinedButton(
                          icon: CustomIconStrings.GOOGLE_RGB,
                          onClick: () => {controller.onLoginWithGoogle()}),
                      const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
                      // - - - - - - - - - - - - - - - - - - LOGIN WITH FACEBOOK - - - - - - - - - - - - - - - - - -  //
                      CustomIconOutlinedButton(
                          icon: CustomIconStrings.FACEBOOK_RGB,
                          onClick: () => {controller.onLoginWithFacebook()}),
                    ],
                  ),
                ],
              )),
        ),
      )
    );
  }
}
