import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomCounter extends Responsive {
  final String counter;
  final GestureTapCallback onDecrement, onIncrement;
  final double size;

  const CustomCounter(
      {super.key,
      required this.counter,
      required this.onDecrement,
       this.size = 3.0,
      required this.onIncrement});

  @override
  Widget execute(BuildContext context) {
    return Row(
      children: [
        // - - - - - - - - - - - - - - - - - - MINUS BUTTON - - - - - - - - - - - - - - - - - -  //
        InkWell(
          onTap: onDecrement,
          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          child: Container(
            decoration: BoxDecoration(
                color: darkLightColor(context).withOpacity(0.2),
                borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2)),
            padding: EdgeInsets.all(size),
            child: const Icon(
              Iconsax.minus,
              color: CustomColors.WHITE,
            ),
          ),
        ),

        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
        const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

        // - - - - - - - - - - - - - - - - - - COUNTER TEXT - - - - - - - - - - - - - - - - - -  //
        Text(counter, style: Theme.of(context).textTheme.titleLarge),

        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
        const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

        // - - - - - - - - - - - - - - - - - - ADD BUTTON - - - - - - - - - - - - - - - - - -  //
        InkWell(
          onTap: onIncrement,
          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          child: Container(
            decoration: BoxDecoration(
                color: primaryColor(context),
                borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2)),
            padding: EdgeInsets.all(size),
            child: const Icon(
              Iconsax.add,
              color: CustomColors.WHITE,
            ),
          ),
        ),
      ],
    );
  }
}
