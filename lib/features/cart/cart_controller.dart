import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/common/widgets/custom_animation_screen.dart';
import 'package:test1/common/widgets/custom_snackbars.dart';
import 'package:test1/data/models/product.dart';
import 'package:test1/data/repositories/local_repositories/cart_repository.dart';
import 'package:test1/utils/local/database/app_database.dart';

class CartController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final RxBool showFloatingActionButton;
  late final ScrollController scrollController;
  late final CartRepository? _repository;
  late final RxList<Product> cartProducts;
  late final AppDatabase? _database;
  late final RxInt total;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    showFloatingActionButton = false.obs;
    total = 0.obs;
    cartProducts = RxList.empty();
    _database = AppDatabase();
    init();
    manageScrollController();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init() async {
    final instance = await _database!.database;
    _repository = CartRepository(instance);

    // await _repository!.insertToCart(Product(
    //     id: 0,
    //     title: "Jacket noir sport 1",
    //     thumbnail1: "nil",
    //     price: 100,
    //     brand: "zara",
    //     discount: 1));
    // await _repository.insertToCart(Product(
    //     id: 1,
    //     title: "Jacket noir sport 2",
    //     thumbnail1: "nil",
    //     price: 300,
    //     brand: "nike",
    //     discount: 1));
    // await _repository.insertToCart(Product(
    //     id: 2,
    //     title: "Jacket noir sport 3",
    //     thumbnail1: "nil",
    //     price: 200,
    //     brand: "adidas",
    //     discount: 1));
    // await _repository.insertToCart(Product(
    //     id: 3,
    //     title: "Jacket noir sport 4",
    //     thumbnail1: "nil",
    //     price: 400,
    //     brand: "nike 2",
    //     discount: 1));
    // await _repository.insertToCart(Product(
    //     id: 4,
    //     title: "Jacket noir sport 5",
    //     thumbnail1: "nil",
    //     price: 500,
    //     brand: "zara 2",
    //     discount: 1));
    await getProductsFromCart();
  }

  // - - - - - - - - - - - - - - - - - - GET PRODUCT CART FROM LOCAL DATABASE - - - - - - - - - - - - - - - - - -  //
  Future<bool> getProductsFromCart() async {
    try {
      /// GET WISHLISTS
      final getProductsFromCart = await _repository!.getProductsFromCart();
      await Future.delayed(const Duration(milliseconds: 500));

      if (getProductsFromCart == null) {
        await Future.delayed(const Duration(milliseconds: 500));
        total.value = 0;
        return false;
      }

      if (getProductsFromCart.isEmpty) {
        total.value = 0;
        cartProducts.value = [];
        return false;
      }

      total.value = 0;
      cartProducts.clear();

      for (Product product in getProductsFromCart) {
        final int productPriceTimeCount =
            product.price! * product.discount!; // DISCOUNT MAIN COUNT
        total.value += productPriceTimeCount;
        cartProducts.add(product);
      }
      return true;

      /// STOP THE LOADER
    } catch (_) {
      return false;
    }
  }

  // - - - - - - - - - - - - - - - - - - SCROLL CONTROLLER - - - - - - - - - - - - - - - - - -  //
  manageScrollController() async {
    scrollController.addListener(() {
      double showOffset = 3.0;
      if (scrollController.offset > showOffset) {
        showFloatingActionButton.value = true;
      } else {
        showFloatingActionButton.value = false;
      }
    });
  }

  // - - - - - - - - - - - - - - - - - - INCREMENT THE COUNTER - - - - - - - - - - - - - - - - - -  //
  incrementTheCounter({required Product product}) async {
    await _updateCounter(product: product, counter: product.discount! + 1);
  }

  // - - - - - - - - - - - - - - - - - - DECREMENT THE COUNTER - - - - - - - - - - - - - - - - - -  //
  decrementTheCounter({required Product product}) async {
    if (product.discount! > 1) {
      await _updateCounter(product: product, counter: product.discount! - 1);
    }
  }

  // - - - - - - - - - - - - - - - - - - UPDATE COUNTER - - - - - - - - - - - - - - - - - -  //
  Future<void> _updateCounter({required Product product, required int counter}) async {
    try {
      /// START LOADER
      Get.to(
          const CustomAnimationScreen(text: "We are updating your cart ..."));

      /// UPDATE ADDRESS
      final Product updateProduct = Product(
          id: product.id,
          title: product.title,
          thumbnail1: product.thumbnail1,
          discount: counter,
          /*DISCOUNT REPLACE IT BY COUNTER*/
          brand: product.brand,
          price: product.price);

      final int resultCode =
          await _repository!.updateProductFromCartById(product: updateProduct);

      if (resultCode == CartRepository.CODE_ERROR) {
        await Future.delayed(const Duration(milliseconds: 500));
        Get.back();
        await Future.delayed(const Duration(milliseconds: 500));

        /// SHOW THE ERROR SNACK BAR
        CustomSnackBars.error(
            title: "We can't update this counter", message: "Try again.");
        return;
      }

      /// UPDATE THE LIST

      await getProductsFromCart();

      /// STOP THE LOADER
      Get.back();
    } catch (_) {
      /// STOP THE LOADER
      await Future.delayed(const Duration(milliseconds: 500));
      Get.back();
      await Future.delayed(const Duration(milliseconds: 500));

      /// SHOW THE ERROR SNACK BAR
      CustomSnackBars.error(
          title: "Error 404", message: "please try again next time!");
    }
  }

  // - - - - - - - - - - - - - - - - - - CHECKOUT BUTTON - - - - - - - - - - - - - - - - - -  //
  void onCheckout() {

  }

  // - - - - - - - - - - - - - - - - - - DELETE CART ITEM - - - - - - - - - - - - - - - - - -  //
  void onDeleteItem({required Product product}) async{
    try {
      /// START LOADER
      Get.to(const CustomAnimationScreen(text: "We are deleting your item card ..."));
      await Future.delayed(const Duration(milliseconds: 500));

      /// DELETE WISHLIST BY ID
      final resultCode = await _repository!.deleteProductCartById(id: product.id!);

      if (resultCode == CartRepository.CODE_ERROR) {
        await Future.delayed(const Duration(milliseconds: 500));
        Get.back();
        await Future.delayed(const Duration(milliseconds: 500));

        /// SHOW THE ERROR SNACK BAR
        CustomSnackBars.error(
            title: "We can't delete this card item", message: "Try again.");
        return;
      }

      getProductsFromCart();

      /// STOP THE LOADER
      Get.back();
      await Future.delayed(const Duration(milliseconds: 500));
      /// FINISHED
      CustomSnackBars.success(
          title: "Done", message: "Your card item deleted successfully!");

    } catch (_) {
      /// STOP THE LOADER
      await Future.delayed(const Duration(milliseconds: 500));
      Get.back();
      await Future.delayed(const Duration(milliseconds: 500));

      /// SHOW THE ERROR SNACK BAR
      CustomSnackBars.error(
          title: "Error 404", message: "please try again next time!");
    }
  }
}
