import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/common/footer/about_us.dart';
import 'package:test1/common/footer/conditions.dart';
import 'package:test1/common/footer/contact_us.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class TabletAccountPrivacyScreen extends Responsive {

  const TabletAccountPrivacyScreen({super.key,});

  @override
  Widget execute(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Privacy", style: Theme.of(context).textTheme.headlineMedium),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Iconsax.arrow_left_24,
            size: 30,
            color: darkLightColor(context),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AboutUs(),
              SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2),
              Divider(),
              SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2),
              ContactUs(),
              SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2),
              Divider(),
              SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2),
              Conditions()
            ],
          ),
        ),
      ),
    );
  }
}