import 'package:flutter/material.dart';
import 'package:test1/common/widgets/custom_elevated_button.dart';
import 'package:test1/common/widgets/custom_text_field.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomPromoCode extends Responsive {
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final GestureTapCallback onClick;

  const CustomPromoCode(
      {super.key,
      required this.controller,
      required this.validator,
      required this.onClick});

  @override
  Widget execute(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 8,
            child: CustomTextField(
                hint: "Have promo code ?",
                validator: validator,
                withDefaultPadding: false,
                width: getWidth(context),
                controller: controller)),
        const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS/2),
        Expanded(
            flex: 2,
            child: CustomElevatedButton(
              text: "Apply",
              onClick: onClick,
              width: getWidth(context),
              withDefaultPadding: false,
              style: ElevatedButton.styleFrom(
                  backgroundColor: grayColor(context),
                  side: BorderSide(color: grayColor(context))),
            ))
      ],
    );
  }
}
