import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_question_response.dart';
import 'package:test1/utils/constants/custom_icon_strings.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/helpers/navigate_in.dart';
import 'package:test1/utils/responsive/responsive.dart';

class PaymentMethodsOffline extends Responsive {
  const PaymentMethodsOffline({super.key});

  @override
  Widget execute(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(CustomTextStrings.PAYMENT_METHODS_OFFLINE),
        leading: InkWell(onTap: ()=> NavigateIn.onBack(context), child: const Icon(Iconsax.arrow_left)),
      ),
      body: Column(
        children: [
          CustomQuestionResponse(
              src: CustomIconStrings.CASH_ON_DELIVERY,
              imgWidth: 150,
              imgHeight: 150,
              imgColor: darkLightColor(context),
              spaceBetweenItems: CustomSizes.SPACE_BETWEEN_ITEMS,
              question: CustomTextStrings.CASH_ON_DELIVERY_TITLE,
              response: CustomTextStrings.CASH_ON_DELIVERY_SUMMARY),
        ],
      ),
    );
  }
}
