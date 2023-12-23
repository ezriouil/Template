import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomQuestionResponse extends Responsive {
  final String? src;
  final String? question;
  final String response;
  final double imgWidth;
  final double imgHeight;
  final Color? imgColor;
  final double spaceBetweenItems;
  final BoxFit? fit;

  const CustomQuestionResponse({
    super.key,
    required this.src,
    required this.question,
    required this.response,
    this.spaceBetweenItems = CustomSizes.SPACE_BETWEEN_ITEMS / 2,
    this.imgColor,
    this.imgHeight = 70.0,
    this.imgWidth = 100.0,
    this.fit
  });

  @override
  Widget execute(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (src != null)
            ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset(src!, width: imgWidth, height: imgHeight, color: imgColor, fit: fit)),
          if (src != null)
            SizedBox(height: spaceBetweenItems),
          if (question != null ) Text(question!, style: Theme.of(context).textTheme.titleLarge),
          if (question != null ) SizedBox(height: spaceBetweenItems),
          ReadMoreText(
            response,
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
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
          Divider(
            indent: getWidth(context) / 8,
            endIndent: getWidth(context) / 8,
            color: grayColor(context),
            height: CustomSizes.SPACE_BETWEEN_SECTIONS,
            thickness: 0.5,
          ),
        ],
      ),
    );
  }
}
