import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_question_response.dart';
import 'package:test1/utils/constants/custom_image_strings.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/helpers/navigate_in.dart';
import 'package:test1/utils/responsive/responsive.dart';

class StoreHistory extends Responsive {
  const StoreHistory({super.key});

  @override
  Widget execute(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Store history"),
        leading: InkWell(onTap: ()=> NavigateIn.onBack(context), child: const Icon(Iconsax.arrow_left)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              const SizedBox(height: CustomSizes.SPACE_DEFAULT),
              Text(CustomTextStrings.APP_NAME,
                  style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),

              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

              Text(CustomTextStrings.STORE_HISTORY_SUMMARY,
                  style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center),

              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

              CustomQuestionResponse(
                  src: CustomImageStrings.STORE_HISTORY_IMG_1,
                  imgWidth: getWidth(context) * 0.8,
                  imgHeight: 200,
                  question: null,
                  fit:BoxFit.fill,
                  response: CustomTextStrings.STORE_HISTORY_SUMMARY_PIC_1),

              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

              CustomQuestionResponse(
                  src: CustomImageStrings.STORE_HISTORY_IMG_2,
                  imgWidth: getWidth(context) * 0.8,
                  imgHeight: 200,
                  question: null,
                  fit: BoxFit.fill,
                  response: CustomTextStrings.STORE_HISTORY_SUMMARY_PIC_2),

              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

              CustomQuestionResponse(
                  src: CustomImageStrings.STORE_HISTORY_IMG_3,
                  imgWidth: getWidth(context) * 0.8,
                  imgHeight: 200,
                  question: null,
                  fit:BoxFit.fill,
                  response: CustomTextStrings.STORE_HISTORY_SUMMARY_PIC_3),

              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS)
            ],
          ),
        ),
      ),
    );
  }
}
