import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_animation_screen.dart';
import 'package:test1/common/widgets/custom_snackbars.dart';
import 'package:test1/data/models/product.dart';
import 'package:test1/data/repositories/local_repositories/wish_list_repository.dart';
import 'package:test1/data/repositories/remote_repositories/product_repository.dart';
import 'package:test1/features/review/screens/mobile_review_screen.dart';
import 'package:test1/features/review/screens/tablet_review_screen.dart';
import 'package:test1/features/review/screens/web_review_screen.dart';
import 'package:test1/utils/device/device_utility.dart';
import 'package:test1/utils/helpers/network.dart';
import 'package:test1/utils/local/database/app_database.dart';

class ProductController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final AppDatabase? _database;
  late final WishListRepository? _wishListRepository;
  late final Rx<Product?> product;
  late Rx<String?> errorMsg, mainThumbnail, sizeSelected;
  late RxList<String> productSizes;
  late RxInt counter;
  late RxBool heart;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    errorMsg = "".obs;
    _database = AppDatabase();
    mainThumbnail = "".obs;
    sizeSelected = "".obs;
    counter = 0.obs;
    productSizes = RxList.empty();
    heart = false.obs;
    product = null.obs;
    _init();
    mainThumbnail.value = testProduct.thumbnail1!;
    updateProductSizesList(testProduct);
  }

// - - - - - - - - - - - - - - - - - - INJECT DEPENDENCIES - - - - - - - - - - - - - - - - - -  //
  Future<void> _init() async {
    final instance = await _database!.database;
    _wishListRepository = WishListRepository(instance);
    // const int productId = 1 /*Get.arguments as int*/;
    // await onGetProductInfo(productId);
    // await onGetProductWishListById(productId);
  }

  // - - - - - - - - - - - - - - - - - - GET PRODUCT INFO FROM SERVER BY ID - - - - - - - - - - - - - - - - - -  //
  Future<void> onGetProductInfo(int id) async {
    try {
      final bool hasConnection = await _checkTheNetwork();
      if (!hasConnection) return;

      /// START LOADER
      Get.to(const CustomAnimationScreen(text: "We are saving your info ..."));
      await Future.delayed(const Duration(milliseconds: 500));

      /// GET PRODUCT BY ID
      final Product? getProduct =
          await ProductRepository.getProductById(productId: id);

      if (getProduct == ProductRepository.CODE_ERROR) {
        await Future.delayed(const Duration(milliseconds: 500));
        Get.back();
        await Future.delayed(const Duration(milliseconds: 500));

        /// SHOW THE ERROR SNACK BAR
        errorMsg.value = "Try again..";
        return;
      }

      /// STOP THE LOADER
      product.value = getProduct;
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

  // - - - - - - - - - - - - - - - - - - INSERT PRODUCT INTO WISHLIST TABLE LOCAL DATABASE - - - - - - - - - - - - - - - - - -  //
  Future<void> onInsertProductIntoWishList(Product product) async {
    try {
      /// START LOADER
      Get.to(const CustomAnimationScreen(text: "We are saving your info ..."));
      await Future.delayed(const Duration(milliseconds: 500));

      /// INSERT WISHLIST BY ID
      final resultCode = await _wishListRepository!.insertWishList(product);

      if (resultCode == WishListRepository.CODE_ERROR) {
        await Future.delayed(const Duration(milliseconds: 500));
        Get.back();
        await Future.delayed(const Duration(milliseconds: 500));

        /// SHOW THE ERROR SNACK BAR
        CustomSnackBars.error(
            title: "We can't insert this wishList", message: "Try again.");
        return;
      }

      /// STOP THE LOADER
      Get.back();
      await Future.delayed(const Duration(milliseconds: 500));

      /// FINISHED
      CustomSnackBars.success(
          title: "Successfully",
          message: "Your product deleted successfully into wishList!");
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

  // - - - - - - - - - - - - - - - - - - GET PRODUCT WISHLIST FROM LOCAL DATABASE BY ID - - - - - - - - - - - - - - - - - -  //
  Future<void> onGetProductWishListById(id) async {
    try {
      /// GET WISHLIST BY ID
      final Product? productWishList =
          await _wishListRepository!.getWishListById(id: id);

      if (productWishList == null) {
        heart.value = false;
        return;
      }

      heart.value = true;
    } catch (_) {
      heart.value = false;
    }
  }

  // - - - - - - - - - - - - - - - - - - UPDATE MAIN THUMBNAIL - - - - - - - - - - - - - - - - - -  //
  void updateMainThumbnail(String? thumbnail) {
    if (mainThumbnail.value != thumbnail) mainThumbnail.value = thumbnail!;
  }

  // - - - - - - - - - - - - - - - - - - UPDATE SIZE STATE - - - - - - - - - - - - - - - - - -  //
  void updateSize(String? size) {
    if (sizeSelected.value != size) sizeSelected.value = size!;
  }

  // - - - - - - - - - - - - - - - - - - INCREMENT THE COUNTER- - - - - - - - - - - - - - - - - -  //
  void incrementTheCounter() {
    counter.value++;
  }

  // - - - - - - - - - - - - - - - - - - DECREMENT THE COUNTER- - - - - - - - - - - - - - - - - -  //
  void decrementTheCounter() {
    if (counter.value > 0) {
      counter.value--;
    }
  }

  // - - - - - - - - - - - - - - - - - - EMPTY PRODUCT - - - - - - - - - - - - - - - - - -  //
  Product emptyProduct() => Product();

  // - - - - - - - - - - - - - - - - - - CHECK THE NETWORK - - - - - - - - - - - - - - - - - -  //
  Future<bool> _checkTheNetwork() async {
    final hasNetwork = await Network.hasConnection();
    if (!hasNetwork) {
      CustomSnackBars.error(
          icon: Iconsax.wifi,
          title: "No internet connection",
          message: "please check your network device.");
      return false;
    }
    return true;
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    _wishListRepository = null;
    _database = null;
    product.close();
    heart.close();
    sizeSelected.close();
    mainThumbnail.close();
    productSizes.close();
    errorMsg.close();
    counter.close();
    errorMsg.close();
  }

  // - - - - - - - - - - - - - - - - - - TEST - - - - - - - - - - - - - - - - - -  //
  final Product testProduct = Product(
      id: 1,
      title: "Jacket cot noir color",
      thumbnail1:
          "https://media.istockphoto.com/id/1342121693/photo/blue-sport-winter-jacket-isolated-on-white-warm-clothes.jpg?s=1024x1024&w=is&k=20&c=4FXMnl-VJmnVp99QAXPfxwKtni8J1weKYO6rvuOg5zs=",
      thumbnail2:
          "https://hips.hearstapps.com/hmg-prod/images/tentree-cloud-shell-puffer-jacket-020-1675265725.jpg?crop=0.752xw:1.00xh;0.126xw,0&resize=640:*",
      thumbnail3:
          "https://www.montbell.us/products/prod_img/zoom/z_2301368_bric.jpg",
      thumbnail4:
          "https://marksandspencer.com.ph/cdn/shop/products/SD_01_T59_1408J_Y0_X_EC_90.jpg?v=1671089721",
      description:
          "Jacket cot noir color Jacket cot noir color Jacket cotr Jacket cot noir color Jacket cotr Jacket cot noir color Jacket cotr Jacket cot noir color Jacket cotr Jacket cot noir color Jacket cot noir color Jacket cot noir color",
      inStock: true,
      discount: 30,
      oldPrice: 230,
      price: 199,
      brand: "Turkey Gum",
      categoryId: "Cot",
      color: "Black",
      sizeSmall: true,
      sizeMedium: true,
      sizeLarge: true,
      sizeXLarge: true,
      sizeXXLarge: true,
      sizeXXXLarge: false,
      sizeXXXXLarge: false);

  // - - - - - - - - - - - - - - - - - - UPDATE PRODUCT SIZES LIST - - - - - - - - - - - - - - - - - -  //
  updateProductSizesList(Product product) {
    final List<String> listSizes = [];
    product.sizeSmall! ? listSizes.add("S") : null;
    product.sizeMedium! ? listSizes.add("M") : null;
    product.sizeLarge! ? listSizes.add("L") : null;
    product.sizeXLarge! ? listSizes.add("XL") : null;
    product.sizeXXLarge! ? listSizes.add("2XL") : null;
    product.sizeXXXLarge! ? listSizes.add("3XL") : null;
    product.sizeXXXXLarge! ? listSizes.add("4XL") : null;
    productSizes.value = listSizes;
  }

  // - - - - - - - - - - - - - - - - - - NAVIGATION TO REVIEW SCREEN - - - - - - - - - - - - - - - - - -  //
  navigateToReviewsScreen({required DeviceType deviceType}) {
    switch (deviceType) {
      case DeviceType.MOBILE:
        Get.to(() => const MobileReviewScreen(), arguments: [testProduct.id]);
      case DeviceType.TABLE:
        Get.to(() => const TabletReviewScreen(), arguments: [testProduct.id]);
      case DeviceType.WEB:
        Get.to(() => const WebReviewScreen(), arguments: [testProduct.id]);
    }
  }

  // - - - - - - - - - - - - - - - - - - ICON SHARE - - - - - - - - - - - - - - - - - -  //
  void onShareIcon() {}

  // - - - - - - - - - - - - - - - - - - BUTTON CHECKOUT - - - - - - - - - - - - - - - - - -  //
  void onCheckOut() {}

  // - - - - - - - - - - - - - - - - - - BUTTON ADD TO BAG - - - - - - - - - - - - - - - - - -  //
  void onAddToBag() {}
}
