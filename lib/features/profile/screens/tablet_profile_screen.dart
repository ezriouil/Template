import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test1/utils/responsive/responsive.dart';

class TabletProfileScreen extends Responsive {
  const TabletProfileScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Update profile info"),
          leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(
              Iconsax.arrow_left_24,
              color: darkLightColor(context),
            ),
          )),
      body: const Placeholder(),
    );
  }
}
