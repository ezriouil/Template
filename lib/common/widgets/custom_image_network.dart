import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/data/models/product.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomImageNetwork extends Responsive {
  final String? src;
  final int? discount;
  final Product product;
  final double height;
  final Function(Product product) onHeartClick;

  const CustomImageNetwork(
      {super.key,
      required this.src,
      this.discount = 0,
      this.height = 150.0,
      required this.onHeartClick,
      required this.product});

  @override
  Widget execute(BuildContext context) {
    const borderRadius8 = BorderRadius.all(Radius.circular(8));
    const borderRadius12 = BorderRadius.all(Radius.circular(12));
    return Stack(
      children: [
        SizedBox(
          width: getWidth(context),
          height: height,
          child: ClipRRect(
            borderRadius: borderRadius8,
            // - - - - - - - - - - - - - - - - - - IMAGE - - - - - - - - - - - - - - - - - -  //
            child: Image.network(
                loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) =>
                    loadingProgress == null
                        ? child
                        : Center(
                            child: CircularProgressIndicator(
                                color: primaryColor(context)),
                          ),
                fit: BoxFit.cover,
                src ?? "",
                errorBuilder: (context, url, error) => Center(
                    child: Icon(Iconsax.gallery_remove,
                        size: 40.0, color: grayColor(context)))),
          ),
        ),
        // - - - - - - - - - - - - - - - - - - DISCOUNT BADGE - - - - - - - - - - - - - - - - - -  //
        if (discount != 0)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4),
            child: Container(
              decoration: const BoxDecoration(
                  color: CustomColors.YELLOW, borderRadius: borderRadius8),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              child: Text("$discount%",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: CustomColors.BLACK)),
            ),
          ),
        // - - - - - - - - - - - - - - - - - - ICON HEART - - - - - - - - - - - - - - - - - -  //
        Positioned(
          right: 4,
          top: 4,
          child: InkWell(
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
                Iconsax.heart5,
                size: 18,
                color: primaryColor(context),
              ),
            ),
          ),
        )
      ],
    );
  }
}
