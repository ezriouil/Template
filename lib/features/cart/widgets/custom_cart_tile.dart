import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_brand.dart';
import 'package:test1/common/widgets/custom_counter.dart';
import 'package:test1/common/widgets/custom_image_network.dart';
import 'package:test1/data/models/product.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomCartTile extends Responsive {
  final GestureTapCallback onDecrement, onIncrement, onDelete;
  final Product? product;

  const CustomCartTile(
      {super.key,
      required this.product,
      required this.onDecrement,
      required this.onDelete,
      required this.onIncrement});

  @override
  Widget execute(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 4,
          horizontal: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 1.5,
            horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
            border: Border.all(color: darkLightColor(context))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

             Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                InkWell(
                    onTap: onDelete,
                    child: Icon(Iconsax.trush_square4,
                        color: darkLightColor(context)))
              ],
            ),
            const SizedBox(
                height: CustomSizes
                    .SPACE_BETWEEN_ITEMS),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomImageNetwork(src: "https://avatars.githubusercontent.com/u/130238246?s=400&u=da527d8650bf8833bf66c213e70d09b8aaa025b7&v=4", width: 70,height: 70),
                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(
                    width: CustomSizes
                        .SPACE_BETWEEN_ITEMS / 2),
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
                      Text("size : ${product!.size()}", style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                )
              ],
            ),

            // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(
                height: CustomSizes
                    .SPACE_BETWEEN_ITEMS),

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
                Text("${product?.price} MAD", style: Theme.of(context).textTheme.titleLarge),
              ],
            )
          ],
        ),
      ),
    );
  }
}
