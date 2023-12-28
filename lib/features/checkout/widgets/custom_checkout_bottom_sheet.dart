import 'package:flutter/material.dart';
import 'package:test1/common/widgets/custom_elevated_button.dart';
import 'package:test1/common/widgets/custom_text_field.dart';
import 'package:test1/utils/constants/custom_icon_strings.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomCheckoutBottomSheet extends Responsive {
  final GestureTapCallback onClick;
  final String? Function(String?) cardNumberValidator,
      zipCodeValidator,
      expiryDayValidator,
      securityCodeValidator,
      cardNameValidator;
  final TextEditingController cardNumberController,
      zipCodeController,
      expiryDateController,
      securityCodeController,
      cardNameController;

  const CustomCheckoutBottomSheet(
      {super.key,
      required this.onClick,
      required this.cardNumberController,
      required this.zipCodeController,
      required this.cardNumberValidator,
      required this.cardNameController,
      required this.expiryDayValidator,
      required this.securityCodeValidator,
      required this.securityCodeController,
      required this.expiryDateController,
      required this.cardNameValidator,
      required this.zipCodeValidator});

  @override
  Widget execute(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: getWidth(context),
        height: getHeight(context) * 0.6,
        padding: const EdgeInsets.all(CustomSizes.SPACE_DEFAULT),
        decoration: BoxDecoration(
          color: darkDarkLightLightColor(context),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(CustomSizes.SPACE_DEFAULT),
            topRight: Radius.circular(CustomSizes.SPACE_DEFAULT),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(CustomIconStrings.MASTER_CARD, height: 50, width: 50),
                  Image.asset(CustomIconStrings.VISA, height: 40, width: 40),
                  Image.asset(CustomIconStrings.RUPAY, height: 50, width: 50),
                  Image.asset(CustomIconStrings.MAESTRO, height: 40, width: 40),
                  Image.asset(CustomIconStrings.APPLE_STORE, height: 50, width: 50)
                ],
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
              CustomTextField(
                  hint: "Card name",
                  validator: cardNameValidator,
                  width: getWidth(context),
                  controller: cardNameController),
              CustomTextField(
                  hint: "Card number",
                  textInputType: TextInputType.number,
                  validator: cardNumberValidator,
                  width: getWidth(context),
                  controller: cardNumberController),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomTextField(
                        hint: "MM/YY",
                        textInputType: TextInputType.number,
                        validator: expiryDayValidator,
                        width: getWidth(context) * 0.5,
                        controller: expiryDateController),
                  ),
                  Expanded(
                    flex: 1,
                    child: CustomTextField(
                        hint: "Security code",
                        obscureText: true,
                        textInputType: TextInputType.number,
                        validator: securityCodeValidator,
                        width: getWidth(context) * 0.5,
                        controller: securityCodeController),
                  )
                ],
              ),
              CustomTextField(
                  hint: "Zip code",
                  validator: zipCodeValidator,
                  width: getWidth(context),
                  textInputType: TextInputType.number,
                  controller: zipCodeController),
              CustomElevatedButton(
                  text: "Valid", onClick: onClick, width: getWidth(context))
            ],
          ),
        ),
      ),
    );
  }
}
