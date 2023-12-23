import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_question_response.dart';
import 'package:test1/utils/constants/custom_icon_strings.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/helpers/navigate_in.dart';
import 'package:test1/utils/responsive/responsive.dart';

class MobileApplication extends Responsive {
  const MobileApplication({super.key});

  @override
  Widget execute(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobile application"),
        leading: InkWell(onTap: ()=> NavigateIn.onBack(context), child: const Icon(Iconsax.arrow_left)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomQuestionResponse(
                src: CustomIconStrings.GOOGLE_STORE,
                question: CustomTextStrings.GOOGLE_STORE_TITLE,
                response: CustomTextStrings.GOOGLE_STORE_SUMMARY),
            const CustomQuestionResponse(
                src: CustomIconStrings.APPLE_STORE,
                question: CustomTextStrings.APPLE_STORE_TITLE,
                response: CustomTextStrings.APPLE_STORE_SUMMARY),
            const CustomQuestionResponse(
                src: CustomIconStrings.HUAWEI_STORE,
                question: CustomTextStrings.HUAWEI_STORE_TITLE,
                response: CustomTextStrings.HUAWEI_STORE_SUMMARY),
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
            Text(CustomTextStrings.PHONE_STORES_LABEL,
                style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
