import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_question_response_animated.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/helpers/navigate_in.dart';
import 'package:test1/utils/responsive/responsive.dart';

class FAQ extends Responsive {
  const FAQ({super.key});

  @override
  Widget execute(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobile application"),
        leading: InkWell(
            onTap: () => NavigateIn.onBack(context),
            child: const Icon(Iconsax.arrow_left)),
      ),
      body: const Column(
        children: [
          /// Q1
          CustomQuestionResponseAnimated(question: CustomTextStrings.Q1, response: CustomTextStrings.R1),
          /// Q2
          CustomQuestionResponseAnimated(question: CustomTextStrings.Q2, response: CustomTextStrings.R2),
          /// Q3
          CustomQuestionResponseAnimated(question: CustomTextStrings.Q3, response: CustomTextStrings.R3),
          /// Q4
          CustomQuestionResponseAnimated(question: CustomTextStrings.Q4, response: CustomTextStrings.R4),
          /// Q5
          CustomQuestionResponseAnimated(question: CustomTextStrings.Q5, response: CustomTextStrings.R5),
          /// Q6
          CustomQuestionResponseAnimated(question: CustomTextStrings.Q6, response: CustomTextStrings.R6),
        ],
      ),
    );
  }
}
