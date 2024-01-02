import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomBrand extends Responsive {
  final String? brand;
  final Color? brandColor;
  final double? textSize, iconSize;

  const CustomBrand(
      {super.key,
      required this.brand,
      this.brandColor,
      this.textSize,
      this.iconSize});

  @override
  Widget execute(BuildContext context) {
    return Row(
      children: [
        // - - - - - - - - - - - - - - - - - - BRAND - - - - - - - - - - - - - - - - - -  //
        Text(
          brand?.toUpperCase() ?? "New",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: brandColor ??
                  grayColor(context).withOpacity(isDark(context) ? 1 : 0.5),
              fontSize: textSize ?? 12),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 3),
        // - - - - - - - - - - - - - - - - - - ICON VERIFY - - - - - - - - - - - - - - - - - -  //
        Icon(Iconsax.verify5, size: iconSize ?? 16, color: CustomColors.DARK_BLUE),
      ],
    );
  }
}
