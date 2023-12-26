import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_animation_screen.dart';
import 'package:test1/common/widgets/custom_snackbars.dart';
import 'package:test1/data/models/review.dart';
import 'package:test1/utils/constants/custom_animations_strings.dart';
import 'package:test1/utils/helpers/network.dart';

class ReviewController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //

  late final TextEditingController reviewController;
  late final GlobalKey<FormState> formState;
  late final RxDouble reviewsRating;
  late final RxList<Review> reviews;
  late final String _productName;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //

  @override
  void onInit() {
    super.onInit();
    reviewController = TextEditingController();
    formState = GlobalKey<FormState>();
    reviews = RxList();
    reviewsRating = 0.0.obs;
    _init();
    _productName = Get.arguments[0];
  }

  void _init() async {
    final List<Review> fakeReviews = [
      Review(
          id: 1,
          userName: "Med ezriouil",
          userComment:
              "Hey everyone, this product is height quality i have being 3 years im using it and he is still keep working with me best greeting to you all. ",
          userRating: 5,
          userCommentTime: "15 Nov, 2023",
          storeComment:
              "Hey everyone, this product is height quality i have being 3 years im using it and he is still keep working with me best greeting to you all. ",
          storeCommentTime: "15 Nov, 2023",
          productTitle: _productName,
          userProfileImg: null),
      Review(
          id: 2,
          userName: "Jalal jalal",
          userComment:
              "Hey everyone, this product is height quality i have being 3 years im using it and he is still keep working with me best greeting to you all. ",
          userRating: 5,
          userCommentTime: "15 Nov, 2023",
          storeComment:
              "Hey everyone, this product is height quality i have being 3 years im using it and he is still keep working with me best greeting to you all. ",
          storeCommentTime: "15 Nov, 2023",
          productTitle: _productName,
          userProfileImg: null),
      Review(
          id: 3,
          userName: "Aicha aicha",
          userComment:
              "Hey everyone, this product is height quality i have being 3 years im using it and he is still keep working with me best greeting to you all. ",
          userRating: 5,
          userCommentTime: "15 Nov, 2023",
          storeComment:
              "Hey everyone, this product is height quality i have being 3 years im using it and he is still keep working with me best greeting to you all. ",
          storeCommentTime: "15 Nov, 2023",
          productTitle: _productName,
          userProfileImg: null),
      Review(
          id: 4,
          userName: "Oumaima oumaima",
          userComment:
              "Hey everyone, this product is height quality i have being 3 years im using it and he is still keep working with me best greeting to you all. ",
          userRating: 5,
          userCommentTime: "15 Nov, 2023",
          storeComment:
              "Hey everyone, this product is height quality i have being 3 years im using it and he is still keep working with me best greeting to you all. ",
          storeCommentTime: "15 Nov, 2023",
          productTitle: _productName,
          userProfileImg: null)
    ];
    await Future.delayed(const Duration(seconds: 3));
    int sum = 0;
    for (Review review in fakeReviews) {
      reviews.add(review);
      sum += review.userRating;
    }
    reviewsRating.value = (sum / reviews.length).toPrecision(1);
  }

  void postReview() async {
    try {
      /// CHECK THE NETWORK
      final hasNetwork = await _checkTheNetwork();
      if (!hasNetwork) return;

      /// CHECK FROM VALIDATION
      if (!formState.currentState!.validate()) return;

      /// START LOADER
      Get.to(
          const CustomAnimationScreen(text: "We are adding your review ..."));
      await Future.delayed(const Duration(milliseconds: 500));

      /// ADD REVIEW INTO SERVER DATABASE
      //
      // if (!sentSuccessfully) {
      //   await Future.delayed(const Duration(milliseconds: 500));
      //   Get.back();
      //   await Future.delayed(const Duration(milliseconds: 500));
      //
      //   /// SHOW THE ERROR SNACK BAR
      //   CustomSnackBars.error(
      //       title: "We can't post you review", message: "try again.");
      //   return;
      // }

      /// STOP THE LOADER
      Get.back();
      await Future.delayed(const Duration(milliseconds: 500));

      /// SHOW SUCCESS MESSAGE
      Get.off(
        CustomAnimationScreen(
            lottieAnime: CustomAnimationStrings.SUCCESSFULLY,
            text: "Post Added Successfully!",
            description:
                "Your post security is our priority we're sent a secure link to safety change your password and keep your account protected.",
            actionText: "Done!",
            onActionClick: () => Get.back()),
      );
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
    reviewController.dispose();
    formState.currentState?.dispose();
    reviews.close();
    reviewsRating.close();
  }
}
