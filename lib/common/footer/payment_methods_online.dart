import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_question_response.dart';
import 'package:test1/utils/constants/custom_icon_strings.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/helpers/navigate_in.dart';
import 'package:test1/utils/responsive/responsive.dart';

class PaymentMethodsOnline extends Responsive {
  const PaymentMethodsOnline({super.key});

  @override
  Widget execute(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(CustomTextStrings.PAYMENT_METHODS_ONLINE),
        leading: InkWell(onTap: ()=> NavigateIn.onBack(context), child: const Icon(Iconsax.arrow_left)),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CustomQuestionResponse(src: CustomIconStrings.VISA, question: CustomTextStrings.VISA_CARD_TITLE, response: CustomTextStrings.VISA_CARD_SUMMARY),
            CustomQuestionResponse(src: CustomIconStrings.MASTER_CARD, question: CustomTextStrings.MASTER_CARD_TITLE, response: CustomTextStrings.MASTER_CARD_SUMMARY),
            CustomQuestionResponse(src: CustomIconStrings.MAESTRO, question: CustomTextStrings.MAESTRO_TITLE, response: CustomTextStrings.MAESTRO_SUMMARY),
            CustomQuestionResponse(src: CustomIconStrings.PAYPAL, question: CustomTextStrings.PAYPAL_TITLE, response: CustomTextStrings.PAYPAL_SUMMARY),
            CustomQuestionResponse(src: CustomIconStrings.APPLE_PAY, question: CustomTextStrings.APPLE_PAY_TITLE, response: CustomTextStrings.APPLE_PAY_SUMMARY),
            CustomQuestionResponse(src: CustomIconStrings.RUPAY, question: CustomTextStrings.RUPAY_TITLE, response: CustomTextStrings.RUPAY_SUMMARY),
            CustomQuestionResponse(src: CustomIconStrings.AMERICAN_EXPRESS, question: CustomTextStrings.AMERICAN_EXPRESS_TITLE, response: CustomTextStrings.AMERICAN_EXPRESS_SUMMARY),
          ],
        ),
      ),
    );
  }
}
