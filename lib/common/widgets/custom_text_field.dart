import 'package:flutter/material.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomTextField extends Responsive {
  final int lines;
  final String hint;
  final bool autoFocus;
  final bool obscureText, readOnly;
  final IconData? leadingIcon;
  final Widget? trailingIcon;
  final TextInputType textInputType;
  final double width;
  final Color? backgroundColor;
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final bool withDefaultPadding;

  const CustomTextField(
      {super.key,
      this.lines = 1,
      required this.hint,
      required this.validator,
      this.autoFocus = false,
      this.readOnly = false,
      this.withDefaultPadding = true,
      this.obscureText = false,
      required this.width,
      required this.controller,
      this.backgroundColor,
      this.textInputType = TextInputType.text,
      this.trailingIcon,
      this.leadingIcon});

  @override
  Widget execute(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
                  withDefaultPadding ? CustomSizes.SPACE_BETWEEN_ITEMS / 2 : 0,
              vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          child: TextFormField(
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
                filled: true,
                fillColor: backgroundColor ?? CustomColors.TRANSPARENT,
                errorStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isDark(context)
                        ? CustomColors.PRIMARY_DARK
                        : CustomColors.PRIMARY_LIGHT),
                hintText: hint,
                prefixIcon: leadingIcon != null
                    ? Icon(
                        leadingIcon,
                        color: grayColor(context),
                      )
                    : null,
                suffixIcon: trailingIcon,
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                        color: backgroundColor == null
                            ? darkLightColor(context)
                            : CustomColors.TRANSPARENT))),
            minLines: lines,
            maxLines: lines,
            autocorrect: false,
            autofocus: autoFocus,
            readOnly: readOnly,
            obscureText: obscureText,
            keyboardType: textInputType,
          )),
    );
  }
}
