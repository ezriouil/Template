import 'package:flutter/material.dart';
import 'index.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

 void main() async{
  //await GetStorage.init();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const Index());
  FlutterNativeSplash.remove();
}

// rename file : shift +  fn + F2
// select next input options : control + option + space
// show parameters : command + P
// refactor the code : option + command + L
// remove the import unused : control + option + O
// show the bubble helper : option + enter
//flutter pub run flutter_native_splash:remove
//flutter pub run flutter_native_splash:create --path=flutter_native_splash.yaml