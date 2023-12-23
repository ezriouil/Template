import 'package:flutter/material.dart';
import 'package:test1/utils/constants/custom_colors.dart';

class CustomAppBarTheme {
  CustomAppBarTheme._();

  /// App Bar For Light Theme
  static AppBarTheme lightAppBarTheme = const AppBarTheme(
      elevation: 0,
      centerTitle: true,
       scrolledUnderElevation: 0.0,
      backgroundColor: CustomColors.TRANSPARENT,
      surfaceTintColor: CustomColors.TRANSPARENT,
      iconTheme: IconThemeData(color: CustomColors.BLACK, size: 24),
      actionsIconTheme: IconThemeData(color: CustomColors.BLACK, size: 24),
      titleTextStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: CustomColors.BLACK));

  /// App Bar For Dark Theme
  static AppBarTheme darkAppBarTheme = const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 0.0,
      backgroundColor: CustomColors.TRANSPARENT,
      surfaceTintColor: CustomColors.TRANSPARENT,
      iconTheme: IconThemeData(color: CustomColors.WHITE, size: 24),
      actionsIconTheme: IconThemeData(color: CustomColors.WHITE, size: 24),
      titleTextStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: CustomColors.WHITE));
}
