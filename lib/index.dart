import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:test1/bindings/root_Bindings.dart';
import 'package:test1/features/cart/screens/mobile_cart_screen.dart';
import 'package:test1/features/checkout/screens/mobile_checkout_screen.dart';
import 'package:test1/features/home/screens/web_home_screen.dart';
import 'package:test1/features/product/screens/mobile_product_screen.dart';
import 'package:test1/utils/responsive/responsive_layout.dart';
import 'package:test1/utils/theme/theme_app.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: RootBindings(),
      home: const ResponsiveLayout(
          mobile: MobileCheckoutScreen(),
          tablet: WebHomeScreen(),
          web: WebHomeScreen()));
}
