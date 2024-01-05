import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_elevated_button.dart';
import 'package:test1/common/widgets/custom_image_network.dart';
import 'package:test1/common/widgets/custom_outlined_button.dart';
import 'package:test1/common/widgets/custom_text_field.dart';
import 'package:test1/features/profile/profile_controller.dart';
import 'package:test1/utils/constants/custom_colors.dart';
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
    const radius32 = Radius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS);
    const verticalDivider = SizedBox(
        height: CustomSizes.SPACE_BETWEEN_SECTIONS,
        child: VerticalDivider(color: CustomColors.WHITE));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor(context),
          title: Text("Update Profile",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: CustomColors.WHITE)),
          leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Iconsax.arrow_left_24,
              color: CustomColors.WHITE,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // - - - - - - - - - - - - - - - - - - IMAGE + STATISTICS - - - - - - - - - - - - - - - - - -  //
              Container(
                width: getWidth(context),
                decoration: BoxDecoration(
                    color: primaryColor(context),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: radius32, bottomRight: radius32)),
                child: Column(
                  children: [
                    // - - - - - - - - - - - - - - - - - - IMAGE - - - - - - - - - - - - - - - - - -  //
                    InkWell(
                      onTap: controller.selectPictureFromDevice,
                      child: Stack(children: [
                        CustomImageNetwork(
                            src:
                                "https://avatars.githubusercontent.com/u/130238246?s=400&u=da527d8650bf8833bf66c213e70d09b8aaa025b7&v=4",
                            width: 150,
                            height: 150,
                            radius: BorderRadius.circular(70)),
                        const Positioned(
                            bottom: 0,
                            right: CustomSizes.SPACE_BETWEEN_ITEMS,
                            child: Icon(
                              Iconsax.edit_24,
                              size: CustomSizes.SPACE_BETWEEN_ITEMS,
                              color: CustomColors.WHITE,
                            ))
                      ]),
                    ),

                    // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                    const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                    // - - - - - - - - - - - - - - - - - - CHANGE PROFILE PICTURE - - - - - - - - - - - - - - - - - -  //
                    Text("Change profile picture",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: CustomColors.WHITE)),

                    // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                    const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                    // - - - - - - - - - - - - - - - - - - STATISTICS - - - - - - - - - - - - - - - - - -  //
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // - - - - - - - - - - - - - - - - - - CONFIRMED ORDERS - - - - - - - - - - - - - - - - - -  //
                          Expanded(
                            child: Column(
                              children: [
                                const Icon(Iconsax.box_tick,
                                    size: 30, color: CustomColors.WHITE),
                                Text(controller.ordersConfirmed.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(color: CustomColors.WHITE)),
                              ],
                            ),
                          ),

                          // - - - - - - - - - - - - - - - - - - VERTICAL DIVIDER - - - - - - - - - - - - - - - - - -  //
                          verticalDivider,

                          // - - - - - - - - - - - - - - - - - - WAITING ORDERS - - - - - - - - - - - - - - - - - -  //
                          Expanded(
                            child: Column(
                              children: [
                                const Icon(Iconsax.box_time,
                                    size: 30, color: CustomColors.WHITE),
                                Text(controller.ordersWaiting.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(color: CustomColors.WHITE)),
                              ],
                            ),
                          ),

                          // - - - - - - - - - - - - - - - - - - VERTICAL DIVIDER - - - - - - - - - - - - - - - - - -  //
                          verticalDivider,

                          // - - - - - - - - - - - - - - - - - - CANCELED ORDERS - - - - - - - - - - - - - - - - - -  //
                          Expanded(
                            child: Column(
                              children: [
                                const Icon(Iconsax.box_remove,
                                    size: 30, color: CustomColors.WHITE),
                                Text(controller.ordersCanceled.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(color: CustomColors.WHITE)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                    const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: CustomSizes.SPACE_BETWEEN_ITEMS,
                    horizontal: CustomSizes.SPACE_DEFAULT),
                child: Form(
                    key: controller.formState,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // - - - - - - - - - - - - - - - - - - FIRST NAME - - - - - - - - - - - - - - - - - -  //
                            Expanded(
                              flex: 1,
                              child: CustomTextField(
                                  leadingIcon: Iconsax.user,
                                  hint: CustomTextStrings.FISRT_NAME,
                                  controller: controller.firstNameController,
                                  validator: (value) =>
                                      Validator.validateEmptyField(
                                          CustomTextStrings.FISRT_NAME, value),
                                  width: getWidth(context),
                                  withDefaultPadding: false),
                            ),

                            // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                            const SizedBox(
                                width: CustomSizes.SPACE_BETWEEN_ITEMS),

                            // - - - - - - - - - - - - - - - - - - LAST NAME - - - - - - - - - - - - - - - - - -  //
                            Expanded(
                              flex: 1,
                              child: CustomTextField(
                                  leadingIcon: Iconsax.user,
                                  hint: CustomTextStrings.LAST_NAME,
                                  controller: controller.lastNameController,
                                  validator: (value) =>
                                      Validator.validateEmptyField(
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
                            validator: (value) =>
                                Validator.validateEmailField(value),
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
            ],
          ),
        ));
  }
}
