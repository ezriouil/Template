import 'package:flutter/material.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomPrices extends Responsive {
  final bool displayPricesVertical;
  final int oldPrice, price;

  const CustomPrices(
      {super.key,
      this.displayPricesVertical = true,
      required this.oldPrice,
      required this.price});

  @override
  Widget execute(BuildContext context) {
    return displayPricesVertical
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // - - - - - - - - - - - - - - - - - - OLD PRICE - - - - - - - - - - - - - - - - - -  //
              RichText(
                text: TextSpan(
                  text: (oldPrice - 1).toString(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: darkLightColor(context).withOpacity(0.6),
                      decoration: TextDecoration.lineThrough),
                  children: [
                    TextSpan(
                      text: ".99 MAD",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: darkLightColor(context).withOpacity(0.6),
                          fontSize: 12.0,
                          decoration: TextDecoration.lineThrough),
                    )
                  ],
                ),
              ),
              // - - - - - - - - - - - - - - - - - - PRICE - - - - - - - - - - - - - - - - - -  //
              RichText(
                text: TextSpan(
                  text: (price - 1).toString(),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: darkLightColor(context), letterSpacing: 0.4),
                  children: [
                    TextSpan(
                      text: ".99 MAD",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: darkLightColor(context), letterSpacing: 0.4),
                    )
                  ],
                ),
              )
            ],
          )
        : Row(
            children: [
              // - - - - - - - - - - - - - - - - - - PRICE - - - - - - - - - - - - - - - - - -  //
              RichText(
                text: TextSpan(
                  text: (price - 1).toString(),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: darkLightColor(context), letterSpacing: 0.4),
                  children: [
                    TextSpan(
                      text: ".99 MAD",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: darkLightColor(context), letterSpacing: 0.4),
                    )
                  ],
                ),
              ),
              // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              // - - - - - - - - - - - - - - - - - - OLD PRICE - - - - - - - - - - - - - - - - - -  //
              RichText(
                text: TextSpan(
                  text: "${oldPrice - 1}",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: darkLightColor(context).withOpacity(0.6),
                      decoration: TextDecoration.lineThrough),
                  children: [
                    TextSpan(
                      text: ".99 MAD",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: darkLightColor(context).withOpacity(0.6),
                          fontSize: 12.0,
                          decoration: TextDecoration.lineThrough),
                    )
                  ],
                ),
              ),
            ],
          );
  }
}
