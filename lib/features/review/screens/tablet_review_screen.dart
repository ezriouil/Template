import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_elevated_button.dart';
import 'package:test1/common/widgets/custom_text_field.dart';
import 'package:test1/features/review/review_controller.dart';
import 'package:test1/features/review/widgets/custom_linear_progress_bar.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/extensions/validator.dart';
import 'package:test1/utils/responsive/responsive.dart';

class TabletReviewScreen extends Responsive {
  const TabletReviewScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final ReviewController controller = Get.put(ReviewController());
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Iconsax.arrow_left_24),
        title: const Text("Review"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(
              "4.5",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Iconsax.star1, size: 24, color: primaryColor(context)),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS * 0.5),
                Icon(Iconsax.star1, size: 24, color: primaryColor(context)),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS * 0.5),
                Icon(Iconsax.star1, size: 24, color: primaryColor(context)),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS * 0.5),
                Icon(Iconsax.star1, size: 24, color: primaryColor(context)),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS * 0.5),
                Icon(Iconsax.star1, size: 24, color: grayColor(context)),
              ],
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS * 0.2),
            Text(
              "107 Reviews",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS * 2),
            const CustomLinearProgressBar(
                number: "1", progressValue: 1, width: 0.7),
            const CustomLinearProgressBar(
                number: "2", progressValue: 0.8, width: 0.7),
            const CustomLinearProgressBar(
                number: "3", progressValue: 0.6, width: 0.7),
            const CustomLinearProgressBar(
                number: "4", progressValue: 0.4, width: 0.7),
            const CustomLinearProgressBar(
                number: "5", progressValue: 0.2, width: 0.7),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

            /// ADD NEW COMMENT
            Text("Add new comment",
                style: Theme.of(context).textTheme.headlineMedium),
            Form(key: controller.formState,
              child: CustomTextField(
                  leadingIcon: Iconsax.message,
                  hint: CustomTextStrings.YOUR_REVIEW,
                  controller: controller.reviewController,
                  validator: (value) => Validator.validateEmptyField(
                      CustomTextStrings.YOUR_REVIEW, value),
                  width: getWidth(context),
                  autoFocus: true,
                  withDefaultPadding: false),
            ),
            SizedBox(
                width: getWidth(context),
                child: CustomElevatedButton(
                    width: getWidth(context), text: "Comment", onClick: () {})),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
          ]),
        ),
      ),
    );
  }

}
