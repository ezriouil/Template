import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_brand.dart';
import 'package:test1/common/widgets/custom_image_network.dart';
import 'package:test1/common/widgets/custom_prices.dart';
import 'package:test1/data/models/product.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomProductVertical extends Responsive {
  final Product product;
  final Function(int id) onClick;
  final Function(Product product) onHeartClick;

  const CustomProductVertical(
      {super.key,
      required this.product,
      required this.onClick,
      required this.onHeartClick});

  @override
  Widget execute(BuildContext context) {
    const borderRadius12 = Radius.circular(12);

    // - - - - - - - - - - - - - - - - - - CARD - - - - - - - - - - - - - - - - - -  //
    return Container(
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: grayColor(context), width: 0.5),
        gradient: LinearGradient(
          colors: [
            CustomColors.GREY_DARK,
            darkDarkLightLightColor(context),
            darkDarkLightLightColor(context)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: InkWell(
        onTap: () => {onClick(product.id ?? 1)},
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS /4),
          // - - - - - - - - - - - - - - - - - - COLUMN - - - - - - - - - - - - - - - - - -  //
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // - - - - - - - - - - - - - - - - - - IMAGE FROM NETWORK - - - - - - - - - - - - - - - - - -  //
              CustomImageNetwork(
                width: getWidth(context) * 0.5,
                height: getWidth(context) * 0.5,
                src: product.thumbnail1,
                hasDiscountBadge: product.discount! > 0,
                product: product,
                onHeartClick: onHeartClick,
              ),
              // - - - - - - - - - - - - - - - - - - TITLE - - - - - - - - - - - - - - - - - -  //
              Text(
                product.title ?? "",
                maxLines: 1,
                style: Theme.of(context).textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
              ),
              CustomBrand(brand: product.brand, iconSize: 12, textSize: 10,),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS/1.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPrices(
                      oldPrice: product.oldPrice ?? 0,
                      price: product.price ?? 0),
                  // - - - - - - - - - - - - - - - - - - ICON ADD - - - - - - - - - - - - - - - - - -  //
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: isDark(context)
                            ? CustomColors.WHITE.withOpacity(0.9)
                            : CustomColors.BLACK.withOpacity(0.9),
                        borderRadius: const BorderRadius.only(
                            topLeft: borderRadius12,
                            bottomRight: borderRadius12)),
                    child: Icon(Iconsax.add,
                        color: isDark(context)
                            ? CustomColors.BLACK
                            : CustomColors.WHITE),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
