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
    return Container(
      padding: const EdgeInsets.only(left: CustomSizes.SPACE_BETWEEN_ITEMS),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
          border: Border.all(color: darkLightColor(context))),
      child: Row(
        children: [
          Expanded(
              flex: 8,
              child: CustomTextField(
                  hint: "Have promo code ?",
                  validator: validator,
                  withBorder: false,
                  withDefaultPadding: false,
                  width: getWidth(context),
                  controller: controller)),
          Expanded(
              flex: 3,
              child: CustomElevatedButton(
                text: "Apply",
                onClick: onClick,
                width: getWidth(context),
                style: ElevatedButton.styleFrom(
                    backgroundColor: grayColor(context),
                    side: BorderSide(color: grayColor(context))),
              ))
        ],
      ),
    );
  }
}
