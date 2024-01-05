import 'package:flutter/material.dart';
import 'package:test1/utils/constants/custom_colors.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomSize extends Responsive {
  final List<String> sizes;
  final String sizeSelected;
  final Function(String) onSizeChange;
  final Color background, textColor;
  final Icon icon;

  const CustomSize({
    super.key,
    required this.sizeSelected,
    required this.onSizeChange,
    required this.sizes,
    required this.background,
    required this.textColor,
    required this.icon,
  });

  @override
  Widget execute(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sizes.length,
          itemBuilder: (BuildContext context, int index) => InkWell(
                onTap: () {
                  onSizeChange(sizes[index]);
                },
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: sizeSelected == sizes[index]
                            ? CustomColors.GREY_DARK
                            : CustomColors.TRANSPARENT,
                        border: Border.all(color: darkLightColor(context)),
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: CustomSizes.SPACE_BETWEEN_SECTIONS),
                    margin: const EdgeInsets.symmetric(
                        horizontal: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                    child: Text(sizes[index],
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(color:  sizeSelected == sizes[index] ? darkDarkLightLightColor(context) : darkLightColor(context)))),
              )),
    );
  }
}
