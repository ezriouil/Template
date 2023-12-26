import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_text_box.dart';
import 'package:test1/common/widgets/custom_icon_button.dart';
import 'package:test1/data/models/product.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomImageNetwork extends Responsive {
  final String? src;
  final int? discount;
  final Product product;
  final double height, width;
  final BorderRadius? radius;
  final BoxFit fit;
  final Color borderColor;
  final Function(Product product)? onHeartClick, onSelected;

  const CustomImageNetwork(
      {super.key,
      required this.src,
      this.discount = 0,
      this.radius,
      this.height = 150.0,
      required this.width,
      this.borderColor = CustomColors.TRANSPARENT,
      this.fit = BoxFit.cover,
      this.onHeartClick,
      this.onSelected,
      required this.product});

  @override
  Widget execute(BuildContext context) {
    const borderRadius8 = BorderRadius.all(Radius.circular(8));
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: 2),
              borderRadius: borderRadius8),
          width: width,
          height: height,
          child: ClipRRect(
            borderRadius: radius ?? borderRadius8,
            // - - - - - - - - - - - - - - - - - - IMAGE - - - - - - - - - - - - - - - - - -  //
            child: GestureDetector(
              onTap: onSelected == null ? null : () => onSelected!(product),
              child: Image.network(
                  loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) =>
                      loadingProgress == null
                          ? child
                          : Center(
                              child: CircularProgressIndicator(
                                  color: primaryColor(context)),
                            ),
                  fit: fit,
                  src ?? "",
                  errorBuilder: (context, url, error) => Center(
                      child: Icon(Iconsax.gallery_remove,
                          size: 40.0, color: grayColor(context)))),
            ),
          ),
        ),
        // - - - - - - - - - - - - - - - - - - DISCOUNT BADGE - - - - - - - - - - - - - - - - - -  //
        if (discount != 0)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4),
            child: CustomTextBox(oldPrice: product.oldPrice!, price: product.price!),
          ),
        // - - - - - - - - - - - - - - - - - - ICON HEART - - - - - - - - - - - - - - - - - -  //
        if (onHeartClick != null)
          Positioned(
            right: 4,
            top: 4,
            child: CustomIconButton(
              onHeartClick: onHeartClick!,
              product: product,
            ),
          )
      ],
    );
  }
}
