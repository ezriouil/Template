import 'package:flutter/material.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomElevatedButton extends Responsive {
  final String text;
  final GestureTapCallback onClick;
  final double width;
  final bool withDefaultPadding;

  const CustomElevatedButton(
      {super.key, required this.text, required this.onClick, required this.width, this.withDefaultPadding = true});

  @override
  Widget execute(BuildContext context) {
    return SizedBox(
        width: getWidth(context),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: withDefaultPadding
              ? CustomSizes.SPACE_BETWEEN_ITEMS / 2
              : 0,
              vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          child: ElevatedButton(
            onPressed:()=> onClick(),
            child: Text(text),
          ),
        ));
  }
}
