import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/data/models/product.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomIconButton extends Responsive {
  final IconData? icon;
  final double size;
  final Color? iconColor;
  final Color? background;
  final Function(Product product) onHeartClick;
  final Product product;

  const CustomIconButton(
      {super.key,
      this.icon = Iconsax.heart5,
      this.size = 18.0,
      this.iconColor,
      this.background,
      required this.product,
      required this.onHeartClick});

  @override
  Widget execute(BuildContext context) {
    const borderRadius8 = BorderRadius.all(Radius.circular(8));
    return InkWell(
      onTap: () => {onHeartClick(product)},
      borderRadius: borderRadius8,
      child: Container(
        decoration: BoxDecoration(
            color: background ?? grayColor(context),
            borderRadius: borderRadius8),
        padding: const EdgeInsets.all(4.0),
        child: Icon(
          icon,
          size: size,
          color: iconColor ?? primaryColor(context),
        ),
      ),
    );
  }
}
