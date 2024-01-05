import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/widgets/custom_empty.dart';
import 'package:test1/common/widgets/custom_grid_view.dart';
import 'package:test1/features/coupon/coupon_controller.dart';
import 'package:test1/features/coupon/widgets/custom_coupon.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/responsive/responsive.dart';

class TabletCouponScreen extends Responsive {
  const TabletCouponScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    // - - - - - - - - - - - - - - - - - - CONTROLLER - - - - - - - - - - - - - - - - - -  //

    final CouponController controller = Get.put(CouponController());
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Coupons", style: Theme.of(context).textTheme.headlineMedium),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Iconsax.arrow_left_24,
            size: 30,
            color: darkLightColor(context),
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(4.0),

          // - - - - - - - - - - - - - - - - - - OBSERVER - - - - - - - - - - - - - - - - - -  //

          child: Obx(() =>

              // - - - - - - - - - - - - - - - - - - LOADING STATE TRUE - - - - - - - - - - - - - - - - - -  //

              controller.isLoading.isTrue
                  ? Center(
                      child: CircularProgressIndicator(
                          color: primaryColor(context)))

                  // - - - - - - - - - - - - - - - - - - LOADING STATE FALSE - - - - - - - - - - - - - - - - - -  //

                  : controller.errorMsg.value != null

                      // - - - - - - - - - - - - - - - - - - HAS ERROR - - - - - - - - - - - - - - - - - -  //

                      ? SizedBox(
                          height: getHeight(context),
                          width: getWidth(context),
                          child: const CustomEmpty(
                            text: "Error 404 !",
                            icon: Iconsax.message_remove,
                          ))
                      : controller.coupon.isEmpty

                          // - - - - - - - - - - - - - - - - - - LIST EMPTY - - - - - - - - - - - - - - - - - -  //

                          ? SizedBox(
                              height: getHeight(context),
                              width: getWidth(context),
                              child: const CustomEmpty(text: "No Coupons !"),
                            )

                          // - - - - - - - - - - - - - - - - - - SHOW DATA - - - - - - - - - - - - - - - - - -  //
                          : CustomGridView(
                              controller: controller.scrollController,
                              itemsHeight: 140,
                              count: controller.coupon.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  CustomCoupon(
                                      coupon: controller.coupon[index])))),
      floatingActionButton: Obx(
        () => AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: controller.showFloatingActionButton.value ? 1.0 : 0.0,
          child: FloatingActionButton(
            onPressed: () {
              controller.scrollController.animateTo(0,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.fastOutSlowIn);
            },
            elevation: 16.0,
            backgroundColor: primaryColor(context),
            child: const Icon(Iconsax.arrow_up_24, color: CustomColors.WHITE),
          ),
        ),
      ),
    );
  }
}
