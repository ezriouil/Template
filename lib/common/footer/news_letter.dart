import 'package:flutter/material.dart';
import 'package:test1/common/widgets/custom_elevated_button.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/responsive/responsive.dart';

class NewsLetter extends Responsive {
  const NewsLetter({super.key});

  @override
  Widget execute(BuildContext context) {
    return Column(
      children: [
        /// TEXT FIELD FOR EMAIL
        /*
        CustomTextField(
            width: getWidth(context),
            lines: 1,
            hint: CustomTextStrings.EMAIL,
            onChange: (text) {},
            leadingIcon: Iconsax.direct_right),

         */

        /// BUTTON SEND
        CustomElevatedButton(
            width: getWidth(context),
            text: CustomTextStrings.SUBSCRIBE_FOR_FREE,
            onClick: () {}),
      ],
    );
  }
}
