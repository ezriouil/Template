import 'package:flutter/material.dart';
import 'package:test1/utils/constants/custom_colors.dart';

class CustomElevatedButtonTheme {
  CustomElevatedButtonTheme._();

  /// Elevated Button For Light Theme
  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shadowColor: CustomColors.PRIMARY_LIGHT,
              elevation: 12,
              backgroundColor: CustomColors.PRIMARY_DARK,
              foregroundColor: CustomColors.WHITE,
              disabledBackgroundColor: CustomColors.GREY_DARK,
              disabledForegroundColor: CustomColors.GREY_DARK,
              side: BorderSide(color: CustomColors.PRIMARY_DARK.withOpacity(0.8)),
              padding: const EdgeInsets.symmetric(vertical: 18),
              textStyle:
                  const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))));

  /// Elevated Button For Dark Theme
  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 12,
              shadowColor: CustomColors.PRIMARY_DARK,
              backgroundColor: CustomColors.PRIMARY_LIGHT,
              foregroundColor: CustomColors.WHITE,
              disabledBackgroundColor: CustomColors.GREY_LIGHT,
              disabledForegroundColor: CustomColors.GREY_LIGHT,
              side: BorderSide(color: CustomColors.PRIMARY_LIGHT.withOpacity(0.8)),
              padding: const EdgeInsets.symmetric(vertical: 18),
              textStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))));
}
