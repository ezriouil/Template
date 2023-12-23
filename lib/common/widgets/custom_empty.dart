import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomEmpty extends Responsive {
  final String text;
  final IconData? icon;

  const CustomEmpty(
      {super.key, required this.text, this.icon});

  @override
  Widget execute(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.w500)),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        Icon(icon ?? Iconsax.note_remove, size: 40, color: darkLightColor(context))
      ],
    );
  }
}
