import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomOnboardingPage extends Responsive {
  final String title, subTitle, animation;

  const CustomOnboardingPage(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.animation});

  @override
  Widget execute(BuildContext context) {
    return Container(
      color: isDark(context) ? CustomColors.BLACK : CustomColors.WHITE,
      width: getWidth(context),
      height: getHeight(context),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              animation,
              width: getWidth(context) * (isMobile(context) ? 0.8 : 0.5),
              height: getHeight(context) * (isMobile(context) ? 0.5 : 0.5),
              repeat: true,
            ),
            Text(title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            Text(subTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
