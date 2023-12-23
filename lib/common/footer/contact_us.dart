import 'package:flutter/material.dart';
import 'package:test1/common/widgets/custom_elevated_button.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/responsive/responsive.dart';

class ContactUs extends Responsive {
  const ContactUs({super.key});

  @override
  Widget execute(BuildContext context) {
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
          /*
          /// TEXT FIELDS FOR FIRST AND LAST NAME
          Row(
            children: [
              Expanded(
                  child: CustomTextField(
                      width: getWidth(context),
                      lines: 1,
                      hint: CustomTextStrings.FISRT_NAME,
                      onChange: (text) {},
                      leadingIcon: Iconsax.user)),
              Expanded(
                  child: CustomTextField(
                width: getWidth(context),
                hint: CustomTextStrings.LAST_NAME,
                onChange: (text) {},
                leadingIcon: Iconsax.user,
              ))
            ],
          ),

          /// TEXT FIELD FOR EMAIL
          CustomTextField(
              width: getWidth(context),
              hint: CustomTextStrings.EMAIL,
              onChange: (text) {},
              leadingIcon: Iconsax.direct_right),

          /// TEXT FIELD FOR SUBJECT
          CustomTextField(
              width: getWidth(context),
              hint: CustomTextStrings.SUBJCT,
              controller: controller.onEvent(SingUpEventOnFirstName()),
              validator: (value){Validator.validateEmptyField(CustomTextStrings.FISRT_NAME, value);},
              leadingIcon: Iconsax.activity),

          /// TEXT FIRLD FOR MESSAGE
          CustomTextField(
              width: getWidth(context),
              lines: 3,
              hint: CustomTextStrings.MESSAGE,
              onChange: (text) {}),


           */

          /// BUTTON SEND
          CustomElevatedButton(
              width: getWidth(context),
              text: CustomTextStrings.SEND_MESSAGE,
              onClick: () {}),
        ],
      ),
    );
  }
}
