import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_question_response.dart';
import 'package:test1/utils/constants/custom_icon_strings.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/helpers/navigate_in.dart';
import 'package:test1/utils/responsive/responsive.dart';

class Shipping extends Responsive {
  const Shipping({super.key});

  @override
  Widget execute(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(CustomTextStrings.SHIPPING),
        leading: InkWell(onTap: ()=> NavigateIn.onBack(context), child: const Icon(Iconsax.arrow_left)),
      ),
      body: CustomQuestionResponse(
          src: CustomIconStrings.SHIPPING,
          imgWidth: 150,
          imgHeight: 150,
          imgColor: darkLightColor(context).withOpacity(0.9),
          spaceBetweenItems: CustomSizes.SPACE_BETWEEN_ITEMS,
          question: null,
          response: CustomTextStrings.SHIPPING_BODY),
    );
  }
}
