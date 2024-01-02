import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:test1/data/models/local_notification.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/constants/custom_txt_strings.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomNotification extends Responsive {
  final LocalNotification notification;
  final Function(LocalNotification notification) onClick;

  const CustomNotification(
      {super.key, required this.notification, required this.onClick});

  @override
  Widget execute(BuildContext context) {
    return Card(
      elevation: isDark(context) ? 12 : 8,
      color: isDark(context) ? CustomColors.BLACK : CustomColors.WHITE,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Iconsax.notification5,
                    size: 30, color: primaryColor(context).withOpacity(0.8)),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                Text("${CustomTextStrings.APP_NAME}   •",
                    style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                Text(notification.time?.substring(7) ?? "01 Mon, 2024",
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis),
                const Spacer(),
                InkWell(
                    onTap: () => {onClick(notification)},
                    child: Icon(Iconsax.close_square4,
                        color: darkLightColor(context))),
              ],
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            Text(notification.title?.toUpperCase() ?? "New notification",
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
            ReadMoreText(
              notification.body ?? "No body",
              trimMode: TrimMode.Line,
              trimExpandedText: " show less",
              trimCollapsedText: " read more",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isDark(context)
                      ? CustomColors.WHITE.withOpacity(0.7)
                      : CustomColors.BLACK.withOpacity(0.7)),
              moreStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: primaryColor(context)),
              lessStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: primaryColor(context)),
            )
          ],
        ),
      ),
    );
  }
}
