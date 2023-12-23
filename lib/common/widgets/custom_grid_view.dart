import 'package:flutter/material.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomGridView extends Responsive {
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemsInRow, count;
  final double itemsHeight, spaceBetweenColumns, spaceBetweenRows;

  const CustomGridView(
      {super.key,
      required this.itemBuilder,
      this.itemsInRow = 2,
      required this.count,
      this.itemsHeight = 300.0,
      this.spaceBetweenColumns = 4.0,
      this.spaceBetweenRows = 2.0});

  @override
  Widget execute(BuildContext context) {
    return GridView.builder(
        itemCount: count,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: itemsInRow,
            mainAxisExtent: itemsHeight,
            mainAxisSpacing: spaceBetweenColumns,
            crossAxisSpacing: spaceBetweenRows),
        itemBuilder: itemBuilder);
  }
}
