import 'package:flutter/material.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomTextBox extends Responsive {
  final int oldPrice, price;
  final String? text;
  final Icon? icon;
  final double verticalPadding, horizontalPadding;
  final Color? background, textColor;
  final Function(String size)? onSelected;

  const CustomTextBox(
      {super.key,
      this.oldPrice = 0,
      this.price = 0,
      this.onSelected,
      this.icon,
      this.text,
      this.background,
      this.textColor,
      this.verticalPadding = 4.0,
      this.horizontalPadding = 6.0});

  @override
  Widget execute(BuildContext context) {
    final calculateDiscount = price == 0 ? "00" : (((oldPrice - price) / oldPrice) * 100).toStringAsFixed(0);
    return InkWell(
      onTap: onSelected == null ? null : () => onSelected!(text!),
      child: Container(
        width: CustomSizes.SPACE_BETWEEN_ITEMS * 2.5,
        decoration: BoxDecoration(
            color: background ?? yellowColor(context),
            borderRadius: const BorderRadius.all(Radius.circular(8.0))),
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding, horizontal: horizontalPadding),
        child: Row(
          children: [
            if (icon != null) icon!,
            if (icon != null)
              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            Text(text ?? "$calculateDiscount%",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: textColor ?? CustomColors.BLACK))
          ],
        ),
      ),
    );
  }
}
