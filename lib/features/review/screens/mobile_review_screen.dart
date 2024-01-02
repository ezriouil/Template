import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_elevated_button.dart';
import 'package:test1/common/widgets/custom_empty.dart';
import 'package:test1/common/widgets/custom_text_field.dart';
import 'package:test1/features/review/review_controller.dart';
import 'package:test1/features/review/widgets/custom_linear_progress_bar.dart';
import 'package:test1/features/review/widgets/custom_review.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/extensions/validator.dart';
import 'package:test1/utils/responsive/responsive.dart';

class MobileReviewScreen extends Responsive {
  const MobileReviewScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final ReviewController controller = Get.put(ReviewController());
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Get.back(), child: const Icon(Iconsax.arrow_left_24)),
        title: const Text("Review"),
      ),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Obx(
              () => Text(
                controller.reviewsRating.value == 0.0
                    ? "Loading"
                    : controller.reviewsRating.value.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(context) / 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Iconsax.star1, size: 24, color: primaryColor(context)),
                  Icon(Iconsax.star1, size: 24, color: primaryColor(context)),
                  Icon(Iconsax.star1, size: 24, color: primaryColor(context)),
                  Icon(Iconsax.star1, size: 24, color: primaryColor(context)),
                  Icon(Iconsax.star1, size: 24, color: grayColor(context)),
                ],
              ),
            ),
            Text(
              "Reviews",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w300),
            ),
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
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

            /// ADD NEW REVIEW
            Text("Your review",
                style: Theme.of(context).textTheme.headlineMedium),
            Form(
              key: controller.formState,
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
                    width: getWidth(context),
                    text: "Comment",
                    onClick: controller.postReview)),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
            SizedBox(
                width: getWidth(context),
                height: getHeight(context) * 0.6,
                child: Obx(
                    () => // - - - - - - - - - - - - - - - - - - LOADING STATE TRUE - - - - - - - - - - - - - - - - - -  //

                        controller.isLoading.isTrue
                            ? Center(
                                child: CircularProgressIndicator(
                                    color: primaryColor(context)))

                            // - - - - - - - - - - - - - - - - - - LOADING STATE FALSE - - - - - - - - - - - - - - - - - -  //

                            : controller.errorMsg.value != null

                                // - - - - - - - - - - - - - - - - - - HAS ERROR - - - - - - - - - - - - - - - - - -  //

                                ? SizedBox(
                                    height: getHeight(context),
                                    width: getWidth(context),
                                    child: const CustomEmpty(
                                      text: "Error 404 !",
                                      icon: Iconsax.message_remove,
                                    ))
                                : controller.reviews.isEmpty

                                    // - - - - - - - - - - - - - - - - - - LIST EMPTY - - - - - - - - - - - - - - - - - -  //

                                    ? SizedBox(
                                        height: getHeight(context),
                                        width: getWidth(context),
                                        child: const CustomEmpty(
                                            text: "No Wish Lists !"),
                                      )

                                    // - - - - - - - - - - - - - - - - - - SHOW DATA - - - - - - - - - - - - - - - - - -  //

                                    : ListView.builder(
                                          itemCount: controller.reviews.length,
                                          itemBuilder:
                                              (BuildContext context, int index) =>
                                                  CustomReview(
                                                      review: controller
                                                          .reviews[index])),
                                    )),
          ]),
        ),
      ),
      floatingActionButton: Obx(
        () => AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: controller.showFloatingActionButton.value ? 1.0 : 0.0,
          child: FloatingActionButton(
            onPressed: () {
              controller.scrollController.animateTo(0,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.fastOutSlowIn);
            },
            elevation: 16.0,
            backgroundColor: primaryColor(context),
            child: const Icon(Iconsax.arrow_up_24, color: CustomColors.WHITE),
          ),
        ),
      ),
    );
  }
}
