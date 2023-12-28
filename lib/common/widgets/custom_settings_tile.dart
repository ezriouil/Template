import 'package:flutter/material.dart';
import 'package:test1/common/widgets/custom_image_network.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomSettingTile extends Responsive {
  final String? imgUrl, title, subTitle;
  final TextStyle? titleStyle, subTitleStyle;
  final IconData? icon;
  final Widget? trailing;
  final GestureTapCallback onClick;

  const CustomSettingTile(
      {super.key,
      this.imgUrl,
      required this.title,
      required this.subTitle,
      this.titleStyle,
      this.subTitleStyle,
      this.trailing,
      required this.onClick,
      this.icon});

  @override
  Widget execute(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Row(
        children: [
          imgUrl == null
              ? Icon(icon, size: 32, color: primaryColor(context))
              : CustomImageNetwork(
                  src: imgUrl,
                  width: 50,
                  height: 50,
                  radius: BorderRadius.circular(50)),
          const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title!,
                    style: titleStyle ?? Theme.of(context).textTheme.bodyLarge),
                Text(
                  subTitle!,
                  style: subTitleStyle ?? Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Spacer(),
          if (trailing != null) Expanded(flex: 2, child: trailing!)
        ],
      ),
    );
  }
}
