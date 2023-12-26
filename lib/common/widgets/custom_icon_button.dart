import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/data/models/product.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomIconButton extends Responsive {
  final IconData? icon;
  final double size;
  final Color? iconColor;
  final Function(Product product) onHeartClick;
  final Product product;

  const CustomIconButton(
      {super.key,
      this.icon = Iconsax.heart5,
      this.size = 18.0,
      this.iconColor,
      required this.product,
      required this.onHeartClick});

  @override
  Widget execute(BuildContext context) {
    const borderRadius12 = BorderRadius.all(Radius.circular(12));
    return InkWell(
      onTap: () => {onHeartClick(product)},
      borderRadius: borderRadius12,
      child: Container(
        decoration: BoxDecoration(
            color: isDark(context)
                ? CustomColors.BLACK.withOpacity(0.2)
                : CustomColors.WHITE.withOpacity(0.2),
            borderRadius: borderRadius12),
        padding: const EdgeInsets.all(6.0),
        child: Icon(
          icon,
          size: size,
          color: iconColor ?? primaryColor(context),
        ),
      ),
    );
  }
}
