import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/data/models/coupon.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomCoupon extends Responsive {
  final Coupon coupon;

  const CustomCoupon({super.key, required this.coupon});

  @override
  Widget execute(BuildContext context) {
    return Card(
      elevation: isDark(context) ? 12 : 8,
      color: isDark(context) ? CustomColors.BLACK : CustomColors.WHITE,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Icon(
                Iconsax.gift,
                color: darkLightColor(context),
              ),
              Text(coupon.availableUntil ?? "",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: grayColor(context))),
            ]),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            Text("${coupon.discount ?? 0}% OFF",
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            DottedBorder(
              color: darkLightColor(context),
              padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS, vertical: CustomSizes.SPACE_BETWEEN_ITEMS/2),
              strokeWidth: 1,
              child: Text(coupon.code?.toUpperCase() ?? "",
                  style: Theme.of(context).textTheme.headlineMedium),
            )
          ],
        ),
      ),
    );
  }
}
