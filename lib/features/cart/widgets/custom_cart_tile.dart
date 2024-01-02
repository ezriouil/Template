import 'package:flutter/material.dart';
import 'package:test1/common/widgets/custom_brand.dart';
import 'package:test1/common/widgets/custom_counter.dart';
import 'package:test1/common/widgets/custom_image_network.dart';
import 'package:test1/data/models/product.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomCartTile extends Responsive {
  final GestureTapCallback onDecrement, onIncrement;
  final Product? product;

  const CustomCartTile(
      {super.key,
      required this.product,
      required this.onDecrement,
      required this.onIncrement});

  @override
  Widget execute(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 4,
          horizontal: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
      child: Container(
        padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
            border: Border.all(color: darkLightColor(context))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageNetwork(
                    src: product?.thumbnail1 ?? "",
                    fit: BoxFit.fill,
                    width: 50,
                    height: 60),
                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // - - - - - - - - - - - - - - - - - - TITLE - - - - - - - - - - - - - - - - - -  //
                      Text(product?.title ?? "",
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),

                      // - - - - - - - - - - - - - - - - - - BRAND - - - - - - - - - - - - - - - - - -  //
                      CustomBrand(brand: product?.brand!),

                      // - - - - - - - - - - - - - - - - - - SIZE - - - - - - - - - - - - - - - - - -  //
                      Text("size : ${product!.size()}",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: grayColor(context)
                                      .withOpacity(isDark(context) ? 1 : 0.5))),
                    ],
                  ),
                )
              ],
            ),

            // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

            // - - - - - - - - - - - - - - - - - - COUNTER + TOTAL - - - - - - - - - - - - - - - - - -  //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // - - - - - - - - - - - - - - - - - - COUNTER - - - - - - - - - - - - - - - - - -  //
                CustomCounter(
                    counter: product!.discount.toString(),
                    onDecrement: onDecrement,
                    onIncrement: onIncrement),

                // - - - - - - - - - - - - - - - - - - TOTAL - - - - - - - - - - - - - - - - - -  //
                Text("${product!.price! - 1}.99 MAD",
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            )
          ],
        ),
      ),
    );
  }
}
