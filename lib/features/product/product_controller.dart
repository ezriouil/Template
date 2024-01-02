import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_animation_screen.dart';
import 'package:test1/common/widgets/custom_snackbars.dart';
import 'package:test1/data/models/product.dart';
import 'package:test1/data/repositories/local_repositories/cart_repository.dart';
import 'package:test1/data/repositories/local_repositories/wish_list_repository.dart';
import 'package:test1/data/repositories/remote_repositories/product_repository.dart';
import 'package:test1/features/cart/screens/mobile_cart_screen.dart';
import 'package:test1/features/cart/screens/tablet_cart_screen.dart';
import 'package:test1/features/cart/screens/web_cart_screen.dart';
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
  late final CartRepository? _cartRepository;
  late final Rx<Product?> product;
  late Rx<String?> errorMsg, mainThumbnail, sizeSelected;
  late RxList<String> productSizes;
  late RxInt counter;
  late RxBool heart;
  late CarouselController pageController;
  late RxInt currentPageIndex;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    errorMsg = "".obs;
    _database = AppDatabase();
    mainThumbnail = "".obs;
    sizeSelected = "".obs;
    counter = 1.obs;
    productSizes = RxList.empty();
    heart = false.obs;
    product = null.obs;
    pageController = CarouselController();
    currentPageIndex = 0.obs;
    _init();
    mainThumbnail.value = testProduct.thumbnail1!;
    updateProductSizesList(testProduct);
  }

// - - - - - - - - - - - - - - - - - - INJECT DEPENDENCIES - - - - - - - - - - - - - - - - - -  //
  Future<void> _init() async {
    final instance = await _database!.database;
    _wishListRepository = WishListRepository(instance);
    _cartRepository = CartRepository(instance);
    onGetProductWishListById(6);
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

  // - - - - - - - - - - - - - - - - - - GET PRODUCT WISHLIST FROM LOCAL DATABASE BY ID - - - - - - - - - - - - - - - - - -  //
  Future<void> onGetProductWishListById(id) async {
    try {
      /// GET WISHLIST BY ID
      final Product? productWishList = await _wishListRepository!.getWishListById(id: id);

      if (productWishList == null) {
        heart.value = false;
        return;
      }

      heart.value = true;
    } catch (_) {
      heart.value = false;
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

  // - - - - - - - - - - - - - - - - - - ICON SHARE - - - - - - - - - - - - - - - - - -  //
  void onShareIcon() {}

  // - - - - - - - - - - - - - - - - - - BUTTON CHECKOUT - - - - - - - - - - - - - - - - - -  //
  onCheckOut({required Product product, required DeviceType deviceType}) async {
    await onAddToBag(product: product, deviceType: deviceType);
  }

  // - - - - - - - - - - - - - - - - - - BUTTON ADD TO BAG - - - - - - - - - - - - - - - - - -  //
  onAddToBag({required Product product, required DeviceType deviceType}) async {
    try {
      /// GET WISHLIST BY ID
      final int resultCode = await _cartRepository!.insertToCart(product);

      if (resultCode == CartRepository.CODE_ERROR) {
        /// SHOW THE ERROR SNACK BAR
        CustomSnackBars.error(
            title: "We can't insert this product to cart",
            message: "Try again.");
        return;
      }

      switch (deviceType) {
        case DeviceType.MOBILE:
          Get.off(() => const MobileCartScreen());
        case DeviceType.TABLE:
          Get.off(() => const TabletCartScreen());
        case DeviceType.WEB:
          Get.off(() => const WebCartScreen());
      }
    } catch (_) {
      /// SHOW THE ERROR SNACK BAR
      CustomSnackBars.error(
          title: "Error 404", message: "please try again next time!");
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
      id: 6,
      title: "Jacket cot noir color",
      thumbnail1:
          "https://static.lefties.com/9/photos2/2024/V/0/1/p/5811/300/712/06/5811300712_2_9_1.jpg?t=1701180509424",
      thumbnail2:
          "https://www.marwa.com/media/catalog/product/cache/ea8393ab089fbcfdc2d5454cda4cf9fa/v/1/v1090h24_black_dos.jpg",
      thumbnail3:
          "https://static.pullandbear.net/2/photos//2023/I/1/1/p/1101/040/040/1101040040_2_1_8.jpg?t=1699002546518&imwidth=750",
      thumbnail4:
          "https://static.lefties.com/9/photos2/2024/V/0/1/p/5801/303/183/01/5801303183_2_2_1.jpg?t=1701948109326",
      description:
          "Jacket cot noir color Jacket cot noir color Jacket cot Jacket cot noir color Jacket cot Jacket cot noir color Jacket cot Jacket cot noir color Jacket cot Jacket cot noir color Jacket cot noir color Jacket cot noir color",
      inStock: true,
      discount: 1,
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
    productSizes.value = product.productSizesAvailable();
  }

  // - - - - - - - - - - - - - - - - - - NAVIGATION TO REVIEW SCREEN - - - - - - - - - - - - - - - - - -  //
  navigateToReviewsScreen({required DeviceType deviceType}) {
    switch (deviceType) {
      case DeviceType.MOBILE:
        Get.to(() => const MobileReviewScreen(),
            arguments: [testProduct.id.toString()]);
      case DeviceType.TABLE:
        Get.to(() => const TabletReviewScreen(), arguments: [testProduct.id]);
      case DeviceType.WEB:
        Get.to(() => const WebReviewScreen(), arguments: [testProduct.id]);
    }
  }
}
