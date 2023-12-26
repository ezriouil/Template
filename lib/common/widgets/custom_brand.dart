import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomBrand extends Responsive {
  final String? brand;
  final Color? brandColor;

  const CustomBrand({super.key, required this.brand, this.brandColor});

  @override
  Widget execute(BuildContext context) {
    return Row(
      children: [
        // - - - - - - - - - - - - - - - - - - BRAND - - - - - - - - - - - - - - - - - -  //
        Text(
          brand?.toUpperCase() ?? "New",
          style: Theme
              .of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: brandColor ?? grayColor(context), fontSize: 12),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
        // - - - - - - - - - - - - - - - - - - ICON VERIFY - - - - - - - - - - - - - - - - - -  //
        const Icon(Iconsax.verify5,
            size: 12, color: CustomColors.BLUE),
      ],
    );
  }
}
