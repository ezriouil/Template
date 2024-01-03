import 'package:flutter/material.dart';
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
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sizes.length,
          itemBuilder: (BuildContext context, int index) =>
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                  onTap: ()=>onSizeChange(sizeSelected),
                  child: Container(
                    width: CustomSizes.SPACE_BETWEEN_ITEMS * 3,
                    decoration: BoxDecoration(
                        color: background,
                        borderRadius: const BorderRadius.all(Radius.circular(8.0))),
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                    child: Row(
                      children: [
                        icon,
                        const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                        Text(sizes[index],
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: textColor))
                      ],
                    ),
                  ),
                ),
              )
      ),
    );

  }
}