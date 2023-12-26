import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_elevated_button.dart';
import 'package:test1/common/widgets/custom_image_network.dart';
import 'package:test1/common/widgets/custom_outlined_button.dart';
import 'package:test1/common/widgets/custom_text_field.dart';
import 'package:test1/features/profile/profile_controller.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/extensions/validator.dart';
import 'package:test1/utils/responsive/responsive.dart';

class MobileProfileScreen extends Responsive {
  const MobileProfileScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    // - - - - - - - - - - - - - - - - - - INSTANCE FROM THE CONTROLLER - - - - - - - - - - - - - - - - - -  //
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Profile"),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Iconsax.arrow_left_24,
            color: darkLightColor(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
              horizontal: CustomSizes.SPACE_DEFAULT),
          child: Form(
              key: controller.formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        InkWell(onTap: controller.selectPictureFromDevice,
                          child: CustomImageNetwork(
                              src:
                                  "https://avatars.githubusercontent.com/u/130238246?s=400&u=da527d8650bf8833bf66c213e70d09b8aaa025b7&v=4",
                              width: 150,
                              height: 150,
                              radius: BorderRadius.circular(70)),
                        ),
                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(
                            height: CustomSizes.SPACE_BETWEEN_ITEMS),

                        // - - - - - - - - - - - - - - - - - - CHANGE PROFILE PICTURE - - - - - - - - - - - - - - - - - -  //
                        Text("Change profile picture",
                            style: Theme.of(context).textTheme.bodySmall),

                        // - - - - - - - - - - - - - - - - - - DIVIDER - - - - - - - - - - - - - - - - - -  //
                        const Divider(),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                      ],
                    ),
                  ),

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

                      // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
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
                      readOnly: true,
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

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                  // - - - - - - - - - - - - - - - - - - BUTTON UPDATE PROFILE INFO - - - - - - - - - - - - - - - - - -  //
                  CustomElevatedButton(
                    text: "Update",
                    onClick: controller.onUpdateProfile,
                    width: getWidth(context),
                    withDefaultPadding: false,
                  ),

                  // - - - - - - - - - - - - - - - - - - BUTTON UPDATE PROFILE INFO - - - - - - - - - - - - - - - - - -  //
                  CustomOutlinedButton(
                    text: "Delete Account",
                    onClick: controller.onDeleteProfile,
                    width: getWidth(context),
                  ),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS)
                ],
              )),
        ),
      ),
    );
  }
}
