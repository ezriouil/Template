import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/footer/footer_controller.dart';
import 'package:test1/common/widgets/custom_elevated_button.dart';
import 'package:test1/common/widgets/custom_text_field.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/extensions/validator.dart';
import 'package:test1/utils/responsive/responsive.dart';

class ContactUs extends Responsive {
  const ContactUs({super.key});

  @override
  Widget execute(BuildContext context) {
    final FooterController controller = Get.put(FooterController());
    return Center(
      child: Column(
        children: [
          Text(CustomTextStrings.ABOUT_US,
              style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
          Text(
            CustomTextStrings.ABOUT_US_BODY,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
          Text(
            CustomTextStrings.ABOUT_US_EXTRA_BODY,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: grayColor(context)),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS/2),

          /// TEXT FIELDS FOR FIRST AND LAST NAME
          Row(
            children: [
              Expanded(flex: 1,
                  child: CustomTextField(
                      leadingIcon: Iconsax.user,
                      hint: CustomTextStrings.FISRT_NAME,
                      controller: controller.firstNameController,
                      validator: (value) => Validator.validateEmptyField(
                          CustomTextStrings.FISRT_NAME, value),
                      withDefaultPadding: false)),

              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS/2),

              Expanded(
                  flex: 1,
                  child: CustomTextField(
                      leadingIcon: Iconsax.user,
                      hint: CustomTextStrings.LAST_NAME,
                      controller: controller.lastNameController,
                      validator: (value) => Validator.validateEmptyField(
                          CustomTextStrings.LAST_NAME, value),
                      withDefaultPadding: false))
            ],
          ),

          // - - - - - - - - - - - - - - - - - - EMAIL - - - - - - - - - - - - - - - - - -  //

          CustomTextField(
              leadingIcon: Iconsax.direct_right,
              hint: CustomTextStrings.EMAIL,
              controller: controller.emailController,
              validator: (value) => Validator.validateEmailField(value),
              textInputType: TextInputType.emailAddress,
              withDefaultPadding: false),

          /// TEXT FIELD FOR SUBJECT
          CustomTextField(
              leadingIcon: Iconsax.activity,
              hint: CustomTextStrings.SUBJCT,
              controller: controller.subjectController,
              validator: (value) => Validator.validateEmptyField(
                  CustomTextStrings.SUBJCT, value),
              withDefaultPadding: false),

          /// TEXT FIRLD FOR MESSAGE
          CustomTextField(
              leadingIcon: Iconsax.message,
              hint: CustomTextStrings.MESSAGE,
              controller: controller.messageController,
              validator: (value) => Validator.validateEmptyField(
                  CustomTextStrings.MESSAGE, value),
              withDefaultPadding: false),


          /// BUTTON SEND
          CustomElevatedButton(
              text: CustomTextStrings.SEND_MESSAGE,
              onClick:controller.onSendMessage),
        ],
      ),
    );
  }
}
