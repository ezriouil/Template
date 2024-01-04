import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/common/footer/about_us.dart';
import 'package:test1/common/footer/conditions.dart';
import 'package:test1/common/footer/contact_us.dart';
import 'package:test1/common/footer/news_letter.dart';
import 'package:test1/features/review/screens/mobile_review_screen.dart';
import 'package:test1/utils/constants/custom_icon_strings.dart';
import 'package:test1/utils/responsive/responsive.dart';

class TabletHomeScreen extends Responsive {
  const TabletHomeScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: Drawer(
          child: ListTile(
              leading: Icon(Icons.home_filled, color: darkLightColor(context)),
              title: Text("Home", style: TextStyle(color: darkLightColor(context)))),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AboutUs(),
                const SizedBox(height: 16),
                const ContactUs(),
                const SizedBox(height: 16),
                const Conditions(),
                const SizedBox(height: 16),
                const NewsLetter(),
                const SizedBox(height: 16),
                SizedBox(width: getWidth(context),
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(()=>const MobileReviewScreen());
                      },
                      child: const Text("Go See Reviews")),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ));
  }
}
