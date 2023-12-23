import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:test1/data/models/review.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomReview extends Responsive {
  final Review review;

  const CustomReview({super.key, required this.review});

  @override
  Widget execute(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                    child: review.userProfileImg != null
                        ? Image.network(review.userProfileImg!)
                        : null),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                Text(review.userName!,
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const Icon(Iconsax.more_24)
          ],
        ),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 8),
        Row(
          children: [
            Row(
              children: [
                Icon(
                  Iconsax.star1,
                  size: 18,
                  color: review.userRating > 0
                      ? primaryColor(context)
                      : grayColor(context),
                ),
                Icon(Iconsax.star1,
                    size: 18,
                    color: review.userRating > 1
                        ? primaryColor(context)
                        : grayColor(context)),
                Icon(Iconsax.star1,
                    size: 18,
                    color: review.userRating > 2
                        ? primaryColor(context)
                        : grayColor(context)),
                Icon(Iconsax.star1,
                    size: 18,
                    color: review.userRating > 3
                        ? primaryColor(context)
                        : grayColor(context)),
                Icon(Iconsax.star1,
                    size: 18,
                    color: review.userRating > 4
                        ? primaryColor(context)
                        : grayColor(context)),
              ],
            ),
            const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
            Text(review.userCommentTime ?? "01 JAN, 2024",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isDark(context)
                        ? CustomColors.WHITE.withOpacity(0.4)
                        : CustomColors.BLACK.withOpacity(0.4)))
          ],
        ),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
        ReadMoreText(
          review.userComment!,
          trimMode: TrimMode.Line,
          trimExpandedText: " show less",
          trimCollapsedText: " read more",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isDark(context)
                  ? CustomColors.WHITE.withOpacity(0.7)
                  : CustomColors.BLACK.withOpacity(0.7)),
          moreStyle: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: primaryColor(context)),
          lessStyle: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: primaryColor(context)),
        ),
        if (review.storeComment != null && review.storeCommentTime != null)
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        if (review.storeComment != null && review.storeCommentTime != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Container(
                padding: const EdgeInsets.all(8.0),
                width: getWidth(context),
                decoration: BoxDecoration(
                    color: grayColor(context),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          CustomTextStrings.STORE_NAME,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(review.storeCommentTime!,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    color: isDark(context)
                                        ? CustomColors.WHITE.withOpacity(0.4)
                                        : CustomColors.BLACK.withOpacity(0.4)))
                      ],
                    ),
                    const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                    ReadMoreText(
                      review.storeComment!,
                      trimMode: TrimMode.Line,
                      trimExpandedText: " show less",
                      trimCollapsedText: " read more",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: isDark(context)
                              ? CustomColors.WHITE.withOpacity(0.7)
                              : CustomColors.BLACK.withOpacity(0.7)),
                      moreStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: primaryColor(context)),
                      lessStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: primaryColor(context)),
                    )
                  ],
                )),
          ),
        Divider(
          indent: getWidth(context) / 8,
          endIndent: getWidth(context) / 8,
          color: grayColor(context),
          height: CustomSizes.SPACE_BETWEEN_SECTIONS,
          thickness: 0.5,
        ),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS)
      ],
    );
  }
}
