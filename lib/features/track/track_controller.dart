import 'package:get/get.dart';
import 'package:test1/data/models/order.dart';
import 'package:test1/data/repositories/remote_repositories/order_repository.dart';

class TrackController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late RxBool isLoading;
  late Rx<String?> errorMsg;
  late RxList<Order> orders;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    isLoading = true.obs;
    errorMsg = null.obs;
    orders = RxList.empty();
    init();
  }


  init() async {
    await _onGetOrders();
  }

  // - - - - - - - - - - - - - - - - - - GET ORDERS FROM REMOTE DATABASE - - - - - - - - - - - - - - - - - -  //
  Future<void> _onGetOrders() async {
    try {
      /// GET ORDERS
      final getOrders = await OrderRepository.getOrders();

      if (getOrders == null) {
        /// SHOW THE ERROR SNACK BAR
        isLoading.value = false;
        errorMsg.value = "Try again..";
        return;
      }

      if (getOrders.isEmpty) {
        orders.value = [];

        /// SHOW THE ERROR SNACK BAR
        isLoading.value = false;
        return;
      }
      orders.addAll(getOrders);

      /// STOP THE LOADER
      isLoading.value = false;
    } catch (_) {
      /// STOP THE LOADER
      isLoading.value = false;
      errorMsg.value = "Try again..";
    }
  }


  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    isLoading.close();
    errorMsg.close();
    orders.close();
  }
}