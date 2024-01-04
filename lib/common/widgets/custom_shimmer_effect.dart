import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test1/common/widgets/custom_grid_view.dart';
import 'package:test1/utils/constants/custom_sizes.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomShimmerEffect extends Responsive {
  final bool gridEffect;
  final Widget child;
  final int itemCount;

  const CustomShimmerEffect(
      {super.key,
      required this.child,
      this.gridEffect = true,
      this.itemCount = 8});

  @override
  Widget execute(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: grayColor(context),
        highlightColor: darkDarkLightLightColor(context),
        child: gridEffect
            ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS/4),
              child: CustomGridView(
                  spaceBetweenRows: CustomSizes.SPACE_BETWEEN_ITEMS / 4,
                  count: 8,
                  itemBuilder: (BuildContext context, int index) =>
                      child),
            )
            : ListView.builder(
                itemCount: itemCount,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) => child));
  }
}
