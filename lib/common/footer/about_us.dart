import 'package:flutter/material.dart';
import 'package:test1/utils/constants/custom_icon_strings.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/helpers/navigation_out.dart';
import 'package:test1/utils/responsive/responsive.dart';

class AboutUs extends Responsive {
  final String logo;
  final double logoSize;
  final double iconSize;
  final String appName;
  final String description;

  const AboutUs(
      {super.key,
      required this.logo,
      this.logoSize = 44.0,
      this.iconSize = 30.0,
      required this.description,
      required this.appName});

  @override
  Widget execute(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(logo, width: logoSize, height: logoSize,color: darkLightColor(context)),
            const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            Expanded(
                child: Text(
              appName,
              style: Theme.of(context).textTheme.titleLarge,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ))
          ],
        ),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS * 1.5),
        Text(description, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS *1.5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: darkLightColor(context), width: 2.0),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(CustomTextStrings.ABOUT_US,
                    style: Theme.of(context).textTheme.titleLarge),
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: NavigationOut.onNavigateToFacebook,
                  child: Image.asset(CustomIconStrings.FACEBOOK,
                      width: iconSize, height: iconSize, color: darkLightColor(context)),
                ),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
                InkWell(
                  onTap: NavigationOut.onNavigateToInstagram,
                  child: Image.asset(CustomIconStrings.INSTAGRAM,
                      width: iconSize, height: iconSize, color: darkLightColor(context)),
                ),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
                InkWell(
                  onTap: NavigationOut.onNavigateToWhatsapp,
                  child: Image.asset(
                    CustomIconStrings.WHATSAPP,
                    width: iconSize,
                    height: iconSize,
                    color: darkLightColor(context),
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
