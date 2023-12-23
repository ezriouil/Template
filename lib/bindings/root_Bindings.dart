import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class RootBindings extends Bindings {
  // - - - - - - - - - - - - - - - - - - INJECT DEPENDENCIES - - - - - - - - - - - - - - - - - -  //

  @override
  void dependencies() {
    Get.put(Connectivity());
  }
}
