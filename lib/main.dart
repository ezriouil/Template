import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test1/bindings/root_Bindings.dart';
import 'package:test1/features/auth/login/screens/mobile_login_screen.dart';
import 'package:test1/features/auth/login/screens/tablet_login_screen.dart';
import 'package:test1/features/auth/login/screens/web_login_screen.dart';
import 'package:test1/utils/responsive/responsive_layout.dart';

import 'utils/theme/theme_app.dart';

void main() async {
  //await GetStorage.init();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  runApp(GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: RootBindings(),
      home: const ResponsiveLayout(
          mobile: MobileLoginScreen(),
          tablet: TabletLoginScreen(),
          web: WebLoginScreen())));
}

// rename file : shift +  fn + F2
// select next input options : control + option + space
// show parameters : command + P
// refactor the code : option + command + L
// remove the import unused : control + option + O
// show the bubble helper : option + enter
//flutter pub run flutter_native_splash:remove
//flutter pub run flutter_native_splash:create --path=flutter_native_splash.yaml
