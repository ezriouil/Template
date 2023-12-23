import 'package:flutter/material.dart';
import 'package:test1/utils/responsive/responsive.dart';

class CustomLinearProgressBar extends Responsive {
  final double width;
  final double progressValue;
  final String number;

  const CustomLinearProgressBar(
      {super.key,
      required this.width,
      required this.number,
      required this.progressValue});

  @override
  Widget execute(BuildContext context) {
    return SizedBox(
      width: getWidth(context) * width,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child:
                  Text(number, style: Theme.of(context).textTheme.titleMedium)),
          Expanded(
            flex: 9,
            child: LinearProgressIndicator(
                backgroundColor: grayColor(context) ,
                color: primaryColor(context),
                value: progressValue,
                minHeight: 12,
                borderRadius: BorderRadius.circular(8)),
          )
        ],
      ),
    );
  }
}
