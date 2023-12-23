import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/helpers/navigate_in.dart';
import 'package:test1/utils/responsive/responsive.dart';

class Cookies extends Responsive {
  const Cookies({super.key});

  @override
  Widget execute(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(CustomTextStrings.COOKIES),
        leading: InkWell(onTap: ()=> NavigateIn.onBack(context), child: const Icon(Iconsax.arrow_left)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                CustomTextStrings.COOKIES_SUMMARY_TITLE,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              Text(
                CustomTextStrings.COOKIES_SUMMARY,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: CustomSizes.SPACE_DEFAULT),
              Text(
                CustomTextStrings.COOKIES_TITLE,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: CustomSizes.SPACE_DEFAULT),

              /// COOKIES 1
              Text(
                CustomTextStrings.COOKIES_1,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              Text(
                CustomTextStrings.COOKIES_1_1,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: CustomSizes.SPACE_DEFAULT),

              /// COOKIES 2
              Text(
                CustomTextStrings.COOKIES_2,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              Text(
                CustomTextStrings.COOKIES_2_2,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: CustomSizes.SPACE_DEFAULT),

              /// COOKIES 3
              Text(
                CustomTextStrings.COOKIES_3,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              Text(
                CustomTextStrings.COOKIES_3_3,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: CustomSizes.SPACE_DEFAULT),

              /// COOKIES 4
              Text(
                CustomTextStrings.COOKIES_4,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              Text(
                CustomTextStrings.COOKIES_4_4,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: CustomSizes.SPACE_DEFAULT),

              /// COOKIES 5
              Text(
                CustomTextStrings.COOKIES_5,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              Text(
                CustomTextStrings.COOKIES_5_5,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: CustomSizes.SPACE_DEFAULT),

              /// COOKIES 6
              Text(
                CustomTextStrings.COOKIES_6,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              Text(
                CustomTextStrings.COOKIES_6_6,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: CustomSizes.SPACE_DEFAULT),

              /// COOKIES 7
              Text(
                CustomTextStrings.COOKIES_7,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              Text(
                CustomTextStrings.COOKIES_7_7,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: CustomSizes.SPACE_DEFAULT),

            ],
          ),
        ),
      ),
    );
  }
}
